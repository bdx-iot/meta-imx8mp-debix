OPTEE_ARCH = "null"
OPTEE_ARCH:arm = "arm32"
OPTEE_ARCH:aarch64 = "arm64"
OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"

OPTEE_TOOLCHAIN = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
OPTEE_COMPILER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"

# Set here but not passed to EXTRA_OEMAKE by default as that breaks
# the optee-os build
TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta_${OPTEE_ARCH}"

EXTRA_OEMAKE += "V=1 \
                 CFLAGS32=--sysroot=${STAGING_DIR_HOST} \
                 CFLAGS64=--sysroot=${STAGING_DIR_HOST} \
                 COMPILER=${OPTEE_COMPILER} \
                 OPTEE_CLIENT_EXPORT=${STAGING_DIR_HOST}${prefix} \
                 TEEC_EXPORT=${STAGING_DIR_HOST}${prefix} \
                "
# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
# right path until this is relocated automatically.
export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
