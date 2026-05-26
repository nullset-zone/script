#!/bin/bash
# Pixel 9 (tokay) — maximum parallel GrapheneOS build
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
JOBS="${JOBS:-$(nproc)}"
export PATH="${HOME}/.local/node/bin:${PATH}"

cd "$ROOT"
source build/envsetup.sh
lunch tokay-cur-user

LOG="${ROOT}/build-tokay-m-j${JOBS}.log"
echo "Building tokay with -j${JOBS}, log: ${LOG}"
m -j"${JOBS}" 2>&1 | tee "${LOG}"
