### cloud/configure-mwasmarm-output

**Goal:** Add `mwasmarm.exe` to the `download_tool` rule's outputs in
`tools/configure.py` so a fresh checkout's first `ninja rom` doesn't
fail with *"no known rule to make mwasmarm.exe"*.

**Context:** `tools/configure.py:511` declares the mwccarm download
build with `outputs=[CC, LD]` (`mwccarm.exe`, `mwldarm.exe`). The asm
rule (line 386) invokes `mwasmarm.exe`, which `download_tool.py`
extracts from the same zip — but ninja doesn't know that, so the first
build of a fresh clone errors out before the download rule runs:

```
ninja: error: 'tools/mwccarm/2.0/sp1p5/mwasmarm.exe', needed by
'build/eur/src/overlay015/ov015_021b316c.o', missing and no known
rule to make it
```

Reproduces on any clean clone. Verified on macOS arm64
2026-05-06 by a brand-new `brain` session running through the
AGENTS.md *Brain onboarding on a fresh machine* checklist — the
documented `python tools/configure.py eur && ninja rom` path failed
at this rule until `python tools/download_tool.py mwccarm latest
--path tools` was run by hand. Once mwccarm.exe and friends are on
disk, ninja considers all three outputs present (because the asm rule's
*input* exists) and the rest of the build proceeds normally.

The bug is invisible to anyone with a populated `tools/mwccarm/` dir
(i.e. every existing brain/decomper machine), which is why nobody
has hit it since the early bootstrapping. It only bites the first
build on a fresh clone.

**Scope:**

- `tools/configure.py` — add `ASM` (the `mwasmarm.exe` path constant
  declared at line 173) to the `outputs` list of the `download_tool`
  build at line 509-513.

**Non-scope:**

- ❌ Any change to `tools/download_tool.py` itself — it already
  unzips all three exes and the DLLs correctly.
- ❌ Reorganizing how the toolchain bundle is unpacked or named.
- ❌ Adding the DLLs (`ELFIO.dll` etc.) to outputs — they're loaded
  implicitly by wine and ninja doesn't need to track them.

**Success:**

- A fresh clone followed by:

  ```bash
  python -m pip install -r tools/requirements.txt
  python tools/configure.py eur
  ninja rom
  ```

  completes without the manual `download_tool.py` workaround step.
- Existing populated clones unaffected (the .exe is already on disk →
  ninja treats the rule as already satisfied; rebuilding `build.ninja`
  from `configure.py` then re-runs the rule once, harmlessly,
  re-extracting the same files).
- AGENTS.md *Brain onboarding* checklist no longer needs a footnote
  about pre-running `download_tool.py`.

**Branch:** `cloud/configure-mwasmarm-output`

**Smoke test for reviewer:**

```bash
rm -rf tools/mwccarm    # simulate fresh checkout
python tools/configure.py eur
ninja rom
```

Should download mwccarm bundle exactly once and proceed to compile.
