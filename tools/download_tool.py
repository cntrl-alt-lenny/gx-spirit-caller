import argparse
from pathlib import Path
from get_platform import get_platform
import zipfile
import io
import requests
import stat

root_path = Path(__file__).parent.parent


platform = get_platform()
if platform is None:
    exit(1)

parser = argparse.ArgumentParser()
parser.add_argument("tool")
parser.add_argument("tag")
parser.add_argument("--path", type=Path, required=True)
args = parser.parse_args()


def dsd_url(tag: str) -> str:
    return f'https://github.com/AetiasHax/ds-decomp/releases/download/{tag}/dsd-{platform.system}-{platform.machine}{platform.exe}'

def mwccarm_url(tag: str) -> str:
    return 'http://decomp.aetias.com/files/mwccarm.zip'

def wibo_url(tag: str) -> str:
    return f'https://github.com/decompals/wibo/releases/download/{tag}/wibo'

def objdiff_url(tag: str) -> str:
    return f'https://github.com/encounter/objdiff/releases/download/{tag}/objdiff-cli-{platform.system}-{platform.machine}{platform.exe}'

def arm_binutils_url(tag: str) -> str:
    # xPack arm-none-eabi-gcc bundles arm-none-eabi-objdump + arm-none-eabi-as,
    # the only binutils the .s/permuter lanes need (brief 369). Whole-toolchain
    # zip; we extract just those two binaries (+ deps) below. tag e.g. v15.2.1-1.1.
    sysmap = {"windows": "win32", "linux": "linux", "macos": "darwin"}
    archmap = {"x86_64": "x64", "arm64": "arm64", "aarch64": "arm64"}
    ver = tag.lstrip("v")
    triple = f'{sysmap[platform.system]}-{archmap[platform.machine]}'
    ext = 'zip' if platform.system == 'windows' else 'tar.gz'  # xPack: Win=.zip, Linux/macOS=.tar.gz (brief 379)
    return (f'https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/'
            f'releases/download/{tag}/xpack-arm-none-eabi-gcc-{ver}-{triple}.{ext}')

TOOLS = {
    "dsd": dsd_url,
    "mwccarm": mwccarm_url,
    "wibo": wibo_url,
    "objdiff": objdiff_url,
    "arm-binutils": arm_binutils_url,
}


download_url = TOOLS[args.tool](args.tag)
print(f'\nDownloading {args.tool} {args.tag}...')
response = requests.get(download_url)
if args.tool == "arm-binutils":
    # The xPack zip is the whole gcc toolchain (~1 GB unpacked). We only need
    # arm-none-eabi-objdump + arm-none-eabi-as, so extract just those (+ their
    # runtime deps) into <path>/bin, flattening the `xpack-<ver>/bin/` prefix.
    # Windows: the deps are DLLs alongside the .exes. Other hosts link their
    # deps from the bundle's lib/ via rpath, so pull lib/ too.
    import re, tarfile
    exe = re.escape(platform.exe)
    if download_url.endswith('.zip'):
        _zf = zipfile.ZipFile(io.BytesIO(response.content)); names = _zf.namelist(); read = _zf.read
    else:  # .tar.gz (Linux/macOS xPack)
        _tf = tarfile.open(fileobj=io.BytesIO(response.content), mode='r:gz')
        names = [m.name for m in _tf.getmembers() if m.isfile()]; read = lambda n: _tf.extractfile(n).read()
    bin_re = re.compile(
        rf'/bin/(arm-none-eabi-objdump{exe}|arm-none-eabi-as{exe}'
        + (r'|[^/]+\.dll' if platform.system == 'windows' else r'') + r')$')
    lib_re = (None if platform.system == 'windows'
              else re.compile(r'(/lib/.*|/arm-none-eabi/lib/.*)'))
    bindir = args.path / "bin"
    bindir.mkdir(parents=True, exist_ok=True)
    count = 0
    for member in names:
        if bin_re.search(member):
            out = bindir / member.split('/bin/')[-1]
            out.write_bytes(read(member))
            out.chmod(out.stat().st_mode | stat.S_IEXEC)
            count += 1
        elif lib_re is not None and lib_re.search(member) and not member.endswith('/'):
            rel = member.split('/', 1)[1]  # drop the xpack-<ver>/ prefix
            out = args.path / rel
            out.parent.mkdir(parents=True, exist_ok=True)
            out.write_bytes(read(member))
            count += 1
    print(f'Extracted {count} arm-binutils file(s) to {args.path}')
elif download_url.endswith('.zip'):
    zip_file = zipfile.ZipFile(io.BytesIO(response.content))
    zip_file.extractall(args.path)
else:
    out_path: Path = args.path
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open('wb') as f:
        f.write(response.content)
    out_path.chmod(out_path.stat().st_mode | stat.S_IEXEC)
