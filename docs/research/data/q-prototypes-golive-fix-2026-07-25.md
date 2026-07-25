# q-prototypes-golive-fix: making the prototypes bank actually includable (2026-07-25)

r11 found `include/game/prototypes.h` (3,891 evidence-backed prototypes,
q-prototypes-h-redo) couldn't yet be `#include`d anywhere: 11 declarations
named types the header chain never defined, and 12 `asm void` functions
were banked as 0-arg despite real callers passing up to 3 args — the
same landmine class that got the original (pre-evidence-only) bank
reverted. This item makes the header genuinely includable, proves it
with a real compiler, and does NOT wire any `#include` — that's a
separate future step.

## Missing types (11 uncompilable declarations → fixed)

`include/game/types.h` only defined `u8`/`u16`/`u32`. A project-wide
grep of the bank found 4 more primitive names in live use: `s32` (20
uses), `fx32` (16), `s8` (1), `BOOL` (1). Added all 4, following the
SAME divergent-from-nitro convention already established for `u32`:

- `s32`: `signed int`, not nitro's `signed long` — matches 3 real
  matched TUs' own local typedefs (`src/main/SysWork_GetPointDistance.c`,
  `src/overlay002/func_ov002_0226ad5c.c`), same width as `long` on
  ARM32 but a distinct C type, so mwcc would hard-error on the
  redefinition the instant a TU saw both spellings — exactly the u32
  problem, same fix.
- `fx32`: `typedef s32 fx32` — matches both nitro's own definition
  shape and the project's local usage.
- `s8`, `BOOL`: no competing project-local spelling found (grepped
  first), so both match `nitro/types.h` exactly (`signed char`, `int`).

## By-value struct/union exclusion (1 known case + a new general rule)

The 1 known case (`func_ov000_021aaa20`, `struct Ov000V3` by value,
defined only inside that one TU) is a genuine instance of a broader
problem the generator never handled: unlike a pointer (always 4 bytes
on ARM32, safely normalizable to `void *` regardless of pointee), a
by-value struct/union's ABI depends on its actual SIZE — no type-erased
spelling stays ABI-correct the way `void *` does. `gen_prototypes.py`
now excludes any function whose return type OR any parameter is a
by-value struct/union, not just this one hardcoded case — a pointer to
the exact same type is untouched (still safely normalized), only
by-value passing triggers it.

## `asm`-bodied exclusion (12 known landmines → 96 found, all excluded)

r11 sampled 12 `asm void` functions banked as 0-arg with a real
arity mismatch. Checking a few by hand (`Fill32`, `CpuSet`, `Sqrt` —
all well-known multi-arg NitroSDK functions) confirmed the root cause
is universal, not a 12-function edge case: **every** `asm`-qualified
definition in this codebase is written `asm void Name(void) { ...raw
instructions... }` — the `(void)` is always a placeholder, because an
asm body has no C-visible parameter references for the real arity to
show up in; the actual arguments just land in whatever registers the
ABI convention puts them, and the hand-written instructions reference
those registers directly. There's no way to tell a genuinely-0-arg asm
function from an actually-N-arg one by reading its C-level signature
alone. `parse_function_definitions()` now excludes every `asm`-qualified
definition unconditionally, regardless of what its written param list
says — **96 functions**, not 12 (r11's number was a sample, not an
exhaustive count). Full list in the generator's own stderr output
(`note: excluded 96 function(s) [asm-bodied...]`) and the PR.

## A new bug the pilot compile caught (not in the original item scope)

The first real pilot-TU compile (see below) failed with cascading
"illegal function definition" errors starting at a declaration like:

```c
extern void func_02032074(void *, alloc_02032074_t, void *);
```

`alloc_02032074_t` is a TU-LOCAL function-pointer typedef
(`typedef void *(*alloc_02032074_t)(int size, int align);`, declared 3
lines above `func_02032074`'s own definition) — invisible outside that
one file, exactly the same "unbankable" class as a TU-local by-value
struct, just for a scalar-looking identifier instead of an aggregate.
The existing "function-pointer parameter, too complex, skip safely"
check (`if "(" in params_raw`) doesn't catch this shape: it looks for a
literal `(` in the raw parameter text, which only appears for an
UN-aliased inline function pointer (`void (*cb)(int)`) — once the
pointer-ness is hidden behind a typedef name, there's no `(` left at
the use site to find.

Fix: `_file_local_typedef_names()` scans each file's own `typedef`s
(both `typedef ... (*NAME)(...);` and plain `typedef ... NAME;` shapes)
and excludes any function whose return type or a non-pointer parameter
names one — same principle as by-value-struct exclusion, and same
"pointer is still safe, only bare-identifier use is not" exception. Found
**33 more functions** this way, 2 of which (`SysWork_GetPointDistance`,
`func_ov002_0226ad5c`) are excluded only because they locally
redeclare `s32`/`fx32` (now also defined globally in `types.h`) —
slightly conservative (these two could theoretically be un-excluded by
comparing the local typedef's actual definition against the global
one), but the simple "any file-local typedef name is unbankable"
rule matches this tool's existing evidence-only/never-guess ethos, and
losing 2 of ~3800 entries is not worth the extra complexity.

## Verification

- `python tools/gen_prototypes.py --write`: 3762 evidence-backed
  prototypes (down from 3795 pre-fix — 130 total exclusions: 96 asm +
  1 by-value-struct + 33 local-typedef; some churn from unrelated
  campaign matches landing between generations).
- `python tools/check_prototypes_provenance.py`: **0 mismatches.**
- `python tools/configure.py eur && ninja sha1`: **OK** — byte-neutral,
  as expected (nothing `#include`s the header yet).
- **Pilot TU compile** (real mwccarm, not a simulation):

  ```
  ./tools/mwccarm/2.0/sp1p5/mwccarm.exe -O4,p -enum int -char signed \
    -str noreuse -proc arm946e -gccext,on -fp soft -inline noauto \
    -Cpp_exceptions off -RTTI off -interworking -w off -sym on -gccinc \
    -nolink -msgstyle gcc -i include -i libs/nitro/include \
    -i libs/runtime/include -lang=c99 -d eur -c pilot_prototypes_include.c \
    -o <outdir>
  ```

  A throwaway TU (`#include "game/prototypes.h"` + a function calling
  `func_02007218` (s32 return), `CTRDG_IsOptionCartridge` (BOOL return),
  `string_put_char` (s8 param) — deliberately exercising the exact
  types this item fixed) compiled to a real `.o` with **exit code 0**.
  Never wired into the real build; discarded after.
- 9 new/updated tests in `tests/test_gen_prototypes.py` (24 total, was
  15) covering all 3 exclusion classes + the non-over-exclusion cases
  (pointer-to-unsafe-type stays safe) + the `skipped` dict reporting.
  One PRE-EXISTING test (`test_asm_qualifier_stripped_from_return_type`)
  was pinning the OLD buggy behavior (keep asm functions, just strip
  the qualifier) — updated to assert the correct new behavior instead
  of left failing.

## Structural constraint documented, not yet exercised

Per r11's finding: the header's own comment now states explicitly that
it's safe to `#include` from a CALLER-only TU, never from a TU that
also DEFINES one of the banked functions (the `void *`-normalized
declaration would conflict with that function's own real, non-`void*`
parameter/return types). Nothing includes the header yet — this item
makes it includable and proves it, wiring the actual `#include` is a
separate future step per the item's own explicit scope.
