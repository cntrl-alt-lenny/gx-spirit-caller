"""Download the project's external tools and verify extracted executables."""
from __future__ import annotations

import argparse
from collections.abc import Callable
import hashlib
import io
import re
import stat
import subprocess
import tarfile
import zipfile
from pathlib import Path
import requests

from get_platform import Platform, get_platform

root_path = Path(__file__).parent.parent


def dsd_url(tag: str, host: Platform) -> str:
    return f"https://github.com/AetiasHax/ds-decomp/releases/download/{tag}/dsd-{host.system}-{host.machine}{host.exe}"


def mwccarm_url(tag: str, host: Platform) -> str:
    del tag, host
    return "http://decomp.aetias.com/files/mwccarm.zip"


def wibo_url(tag: str, host: Platform) -> str:
    del host
    return f"https://github.com/decompals/wibo/releases/download/{tag}/wibo"


def objdiff_url(tag: str, host: Platform) -> str:
    return f"https://github.com/encounter/objdiff/releases/download/{tag}/objdiff-cli-{host.system}-{host.machine}{host.exe}"


def arm_binutils_url(tag: str, host: Platform) -> str:
    sysmap = {"windows": "win32", "linux": "linux", "macos": "darwin"}
    archmap = {"x86_64": "x64", "arm64": "arm64", "aarch64": "arm64"}
    ver = tag.lstrip("v")
    triple = f"{sysmap[host.system]}-{archmap[host.machine]}"
    ext = "zip" if host.system == "windows" else "tar.gz"
    return f"https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/{tag}/xpack-arm-none-eabi-gcc-{ver}-{triple}.{ext}"


def _cache_marker(tool: str, tag: str, url: str, path: Path) -> Path:
    identity = f"{tool}\n{tag}\n{url}\n".encode()
    digest = hashlib.sha256(identity).hexdigest()[:16]
    destination = path / "mwccarm" if tool == "mwccarm" else path
    return destination / f".download-tool-{tool}-{digest}.complete"


def _mwccarm_cache_is_valid(path: Path, marker: Path) -> bool:
    expected = (
        path / "mwccarm/2.0/sp1p5/mwccarm.exe",
        path / "mwccarm/2.0/sp1p5/mwldarm.exe",
        path / "mwccarm/2.0/sp1p5/mwasmarm.exe",
        path / "mwccarm/1.2/sp2p3/mwccarm.exe",
        path / "mwccarm/1.2/sp3/mwccarm.exe",
    )
    return marker.is_file() and all(tool.is_file() for tool in expected)


def _downloaded_binaries(tool: str, path: Path, host: Platform) -> list[Path]:
    if tool != "arm-binutils":
        return []
    return [
        path / "bin" / f"arm-none-eabi-objdump{host.exe}",
        path / "bin" / f"arm-none-eabi-as{host.exe}",
    ]


def verify_downloaded_tool(
    tool: str,
    path: Path,
    host: Platform,
    *,
    runner: Callable[..., subprocess.CompletedProcess] = subprocess.run,
) -> None:
    """Fail clearly if an extracted tool exists but cannot actually launch."""
    for binary in _downloaded_binaries(tool, path, host):
        if not binary.is_file():
            raise RuntimeError(f"Downloaded {tool} is missing required binary: {binary}")
        try:
            result = runner(
                [str(binary), "--version"], capture_output=True, text=True, timeout=10
            )
        except OSError as exc:
            raise RuntimeError(f"Downloaded {tool} failed to launch: {binary}: {exc}") from exc
        output = "\n".join(
            filter(None, [(result.stdout or "").strip(), (result.stderr or "").strip()])
        )
        if result.returncode != 0:
            detail = output or f"exit code {result.returncode}"
            raise RuntimeError(f"Downloaded {tool} failed its runtime check: {binary}\n{detail}")
        if not output:
            raise RuntimeError(f"Downloaded {tool} ran but produced no version output: {binary}")


def _extract_arm_binutils(response: requests.Response, url: str, path: Path, host: Platform) -> None:
    """Extract objdump, as, and their bundled runtime libraries."""
    exe = re.escape(host.exe)
    if url.endswith(".zip"):
        archive = zipfile.ZipFile(io.BytesIO(response.content))
        names = archive.namelist()
        read = archive.read
    else:
        archive = tarfile.open(fileobj=io.BytesIO(response.content), mode="r:gz")
        names = [member.name for member in archive.getmembers() if member.isfile()]

        def read(name: str) -> bytes:
            extracted = archive.extractfile(name)
            if extracted is None:
                raise RuntimeError(f"Archive member disappeared: {name}")
            return extracted.read()

    bin_re = re.compile(
        rf"/bin/(arm-none-eabi-objdump{exe}|arm-none-eabi-as{exe}"
        + (r"|[^/]+\.dll" if host.system == "windows" else "")
        + r")$"
    )
    lib_re = None if host.system == "windows" else re.compile(r"(/lib/.*|/arm-none-eabi/lib/.*)")
    bindir = path / "bin"
    bindir.mkdir(parents=True, exist_ok=True)
    count = 0
    for member in names:
        if bin_re.search(member):
            out = bindir / member.split("/bin/")[-1]
            out.write_bytes(read(member))
            out.chmod(out.stat().st_mode | stat.S_IEXEC)
            count += 1
        elif lib_re is not None and lib_re.search(member) and not member.endswith("/"):
            out = path / member.split("/", 1)[1]
            out.parent.mkdir(parents=True, exist_ok=True)
            out.write_bytes(read(member))
            count += 1
    print(f"Extracted {count} arm-binutils file(s) to {path}")


def main(argv: list[str] | None = None) -> int:
    host = get_platform()
    if host is None:
        return 1
    parser = argparse.ArgumentParser()
    parser.add_argument("tool", choices=["dsd", "mwccarm", "wibo", "objdiff", "arm-binutils"])
    parser.add_argument("tag")
    parser.add_argument("--path", type=Path, required=True)
    args = parser.parse_args(argv)
    url_builders = {
        "dsd": dsd_url,
        "mwccarm": mwccarm_url,
        "wibo": wibo_url,
        "objdiff": objdiff_url,
        "arm-binutils": arm_binutils_url,
    }
    download_url = url_builders[args.tool](args.tag, host)
    cache_marker = _cache_marker(args.tool, args.tag, download_url, args.path)
    if args.tool == "mwccarm" and _mwccarm_cache_is_valid(args.path, cache_marker):
        print(f"Using cached {args.tool} {args.tag} at {args.path / 'mwccarm'}")
        return 0

    print(f"\nDownloading {args.tool} {args.tag}...")
    response = requests.get(download_url)
    response.raise_for_status()
    if args.tool == "arm-binutils":
        _extract_arm_binutils(response, download_url, args.path, host)
    elif download_url.endswith(".zip"):
        with zipfile.ZipFile(io.BytesIO(response.content)) as archive:
            archive.extractall(args.path)
    else:
        args.path.parent.mkdir(parents=True, exist_ok=True)
        args.path.write_bytes(response.content)
        args.path.chmod(args.path.stat().st_mode | stat.S_IEXEC)

    verify_downloaded_tool(args.tool, args.path, host)
    if args.tool == "mwccarm":
        cache_marker.parent.mkdir(parents=True, exist_ok=True)
        cache_marker.write_text(
            f"{args.tool}\n{args.tag}\n{download_url}\n", encoding="utf-8"
        )
        print(f"Marked {args.tool} cache complete: {cache_marker}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
