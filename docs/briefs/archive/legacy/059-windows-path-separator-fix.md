### cloud/windows-path-separator-fix

**Goal:** Fix `tools/patch_objects_legacy.py` so its rewrite
runs on Windows. Brief 058's `cmd /c` wrap (PR #394) unblocked
the Ninja shell-chain layer, but `ninja rom` on Windows then
dies at the final mwldarm link step with
`Specified file build\eur\src\main\func_0203eee0.o not found`.
Root cause: `patch_objects_legacy.py` uses POSIX-style
forward-slash paths in its `endswith()` check while `dsd` on
Windows emits backslash paths in `objects.txt`. The rewrite
silently no-ops for every legacy-routed TU, leaving mwldarm
to fail on the first missing `.legacy[_sp3].o`.

**Context:**

Brain pulled cloud's PR #394 on Windows, ran the full
end-to-end smoke test. 1459 / 1462 ninja steps complete —
the `cmd /c` wrap and the new helper work exactly as
designed. Step 1460 (mwldarm) fails:

```
[1460/1462] ".\tools\mwccarm\2.0\sp1p5\mwldarm.exe" -proc arm946e
  ... @build\eur\objects.txt build\eur\arm9.lcf -o build\eur\arm9.o
FAILED: [code=1] build/eur/arm9.o
.\tools\mwccarm\2.0\sp1p5\mwldarm.exe: Specified file
.\tools\mwccarm\2.0\sp1p5\mwldarm.exe: 'build\eur\src\main\func_0203eee0.o'
.\tools\mwccarm\2.0\sp1p5\mwldarm.exe: not found
```

Inspection on the brain's Windows checkout:

```
arm9.lcf line 687:    func_0203eee0.legacy_sp3.o(.text)    ← what mwldarm wants
objects.txt line 613: build\eur\src\main\func_0203eee0.o   ← what mwldarm has
```

The file `func_0203eee0.legacy_sp3.o` *does* exist on disk —
the `mwcc_legacy_sp3` rule produced it correctly. It just
isn't in objects.txt under that name. `patch_objects_legacy.py`
is the patcher whose job is exactly this rewrite (per its
docstring + brief 039 + brief 045). On this Windows host, it
does nothing for 54 separate files (29 `.legacy.c` + 25
`.legacy_sp3.c`). mwldarm reports only the first and bails.

**Root cause** (line 149 of `tools/patch_objects_legacy.py`):

```python
parent = source.parent.as_posix()        # forward-slash form
return (
    f"{parent}/{stem_no_legacy}.o",      # buggy suffix
    f"{parent}/{stem_with_legacy}.o",    # fixed  suffix
)
```

And line 179:

```python
if line.endswith(buggy) and not line.endswith(fixed):
```

`source.parent.as_posix()` deliberately yields a forward-
slash path. But `line` (read from `objects.txt`) on Windows
contains backslash paths (`build\eur\src\main\func_X.o`).
`line.endswith("src/main/func_X.o")` → `False` for every
Windows path. The rewrite silently no-ops; mwldarm fails;
build dies.

Linux and macOS contributors don't hit this because `dsd` on
those platforms emits POSIX-style paths in objects.txt
natively. The same `dsd` binary on Windows emits backslashes
(via Rust's platform-default path separator).

**Scope:**

Make `patch_objects_legacy.py`'s line-matching path-separator-
agnostic. Two viable approaches; cloud picks:

**Approach A (minimal, normalize for matching only).** Compare
on a POSIX-normalized copy of each line; rewrite the original
preserving its native separator style. Pattern:

```python
for raw in text.splitlines(keepends=True):
    line = raw.rstrip("\n").rstrip("\r")
    line_norm = line.replace("\\", "/")
    for buggy, fixed in rewrite_map.items():
        if line_norm.endswith(buggy) and not line_norm.endswith(fixed):
            # rewrite operates on a fixed-length tail, so the
            # head's separator style is preserved verbatim.
            head = line[: -len(buggy)]
            line = head + fixed
            changed += 1
            break
```

Caveat: this writes the fixed suffix in POSIX form
(forward slashes) regardless of the head's style. Confirm
mwldarm on Windows accepts mixed separators — empirically
it does on the dqix template and most cmd-shell-era MS
tooling, but verify before merge.

**Approach B (normalize everything to POSIX).** Convert
every `objects.txt` line to forward-slash form, do the
rewrite POSIX-only, write POSIX-only output. Cleaner but
diverges from `dsd`'s native output style on Windows
contributors' diffs of `objects.txt` (a build artifact, so
the diff doesn't ship — but it makes brain's "what changed?"
inspection less faithful to upstream).

Approach A is the minimal change. Approach B is more
uniform. Cloud's call.

**Required smoke test (brain will re-run before merge):**

On Windows (brain's environment — `C:\Users\leona\Dev\gx-
spirit-caller`):

```
git checkout cloud/windows-path-separator-fix
python tools/configure.py eur
ninja rom
.\dsd.exe check modules -c config\eur\arm9\config.yaml
```

Expected:
1. `ninja rom` builds to completion (the final 3 of 1462
   steps that brief-058's verify run couldn't reach now
   succeed). `gx-spirit-caller_eur.nds` produced.
2. `dsd check modules` reports the 24/27 OK baseline (ARM9
   main, DTCM, overlay 4 still red — known artifacts; no
   regression of any other module).

On Linux **or** macOS (cloud verifies or pings a non-Windows
brain to verify):

```
python tools/configure.py eur
ninja rom
```

Expected: byte-identical `gx-spirit-caller_eur.nds` to
current `main`. The POSIX path must not regress. The
existing `tests/test_patch_objects_legacy.py` suite must
still pass; extend it with backslash-input cases.

**Recommended test additions:**

In `tests/test_patch_objects_legacy.py`, add cases pinning:

1. Backslash-style `objects.txt` line gets correctly
   rewritten to the `.legacy.o` / `.legacy_sp3.o` form.
2. Mixed-separator line (e.g. `build/eur\src\main\func_X.o`)
   gets correctly rewritten.
3. The rewrite is idempotent on Windows-form input
   (running twice = same as running once).
4. Existing POSIX-input tests stay green (no regression
   for Linux/macOS).

**Non-scope:**

- ❌ Auditing every other patch script in `tools/` for
  similar POSIX-path assumptions. `patch_lcf_arm9_align.py`
  and `patch_section_align.py` evidently work on Windows
  (the build reached step 1460 — they ran). If a separate
  Windows path-sep bug surfaces in another patcher, file a
  follow-up brief.
- ❌ Touching `dsd` itself or asking upstream to emit
  POSIX-style paths on Windows. The patcher is our chosen
  integration layer for dsd quirks per the brief 039
  precedent.
- ❌ Touching `src/`, `AGENTS.md`, `docs/state.md`.
- ❌ Replacing the `.legacy.c` / `.legacy_sp3.c` filename
  convention (briefs 037 / 045). Those are deliberate.

**Success:**

- Brain on Windows runs `ninja rom` to completion. SHA-1
  gate reachable; 24/27 baseline confirmed via `dsd check
  modules`.
- Linux / macOS builds still produce byte-identical
  `gx-spirit-caller_eur.nds` (sanity-check by diffing
  `objects.txt` between this branch and current main on a
  non-Windows runner — should be identical).
- PR body shows brain's Windows reproducer output
  (pre-fix failing log + post-fix successful build snippet
  + `dsd check modules` showing 24/27 OK).

**Branch:** `cloud/windows-path-separator-fix`

**Priority:** HIGH. Brain on Windows is still blocked from
verifying any `src/`-touching PR. PR #392 (decomper wave
22, brief 057 self-extend 1/2) has been parked through
briefs 058 and now 059; landing this is the final step
before brain can clear #392 on Windows.

**After this brief lands:**

1. Brain re-runs the Windows smoke test on merged main,
   confirms `ninja rom` + 24/27 baseline.
2. Brain re-verifies PR #392 on Windows (`ninja rom` on
   #392's branch, `dsd check modules` baseline preserved).
3. PR #392 merges.
4. Decomper unblocks for brief 057 self-extend 2/2 (same
   selection rule).
