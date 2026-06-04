[//]: # (markdownlint-disable MD013 MD041)

# Brief 336 — ov018 clean-C wave 1 (fresh overlay)

**Brief:** 336 (decomper, Windows lane). Pivot to a fresh overlay; clean-C
wave 1. Default pick ov019, but survey ov019 / ov003 / ov018 first and take the
richest CLONE FAMILIES. Own `src/overlay018/` + the delinks.txt + a new
`ov018_core.h`. Full recipe library; reshape register-CHOICE inline, defer
scheduling/allocator/permuter to the Mac backlog. Per-pick gate EUR objdiff
100%; wire EUR delinks. Target ~10-12.

## Headline — 12 matched, top of the target range

**12 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** ov018
was the richest clone-family pick of the three surveyed, and it delivered: the
ov017 metrics/mode-getter recipes, the ov020 BG-config builder, the
`func_0207f934` cell-draw family, and the bind-base OAM-flag op all recurred
and transferred. Five new recipe levers were harvested (below) — three of them
flipped functions that first looked allocator-walled.

## Survey — why ov018 over ov019 / ov003

Size-histogram clustering of the `<0x100` gap cohort (count of funcs sharing a
size with ≥2 members): **ov018 = 9 clustered** (0x68×3, 0xe8×2, 0x84×2,
0x4c×2), ov003 = 8, ov019 = 5. Reading seeds confirmed ov018's clusters are
real clone families — the cell-config draw (`func_0207f934`), the bind-base
OAM-flag op (`oam+0x9b4`), and the BG-config builder each recur, and ov017's
metrics-accessor + ov020's BG-config recipes were recognizable on sight.

## The 12 picks

| func | size | shape | recipe |
|---|---|---|---|
| `021aa920` | 0x68 | 2-call metrics accessor | ov017 metrics recipe |
| `021aa818` | 0x84 | mode getter | u16 bitfield + switch |
| `021aad64` | 0x2c | OAM redraw-flag set, 1 guard | bind-base (+0x900/+0xb4) |
| `021aad90` | 0x5c | OAM redraw-flag set, 2 guards | bind-base |
| `021aa794` | 0x84 | BG-config builder | ov020 recipe; `(u16)a1` cast |
| `021ab48c` | 0x68 | MMIO scroll reset + 2 re-seeds | direct MMIO |
| `021acda0` | 0x74 | confirm-state tick | bind-base + `OamCtl.b0` + state switch |
| `021accc8` | 0xd8 | fade countdown | `func_020b3870` divmod + const-reuse |
| `021ab054` | 0xe8 | D-pad count handler | bind-base + const-reuse -1 + op-order |
| `021aaa88` | 0x68 | cell-run draw (`func_0207f934`) | **returns the count** |
| `021aace4` | 0x80 | gauge cell draw (sibling) | **returns the count** |
| `021aaaf0` | 0xe8 | gauge-row dispatcher | bitfield guard + ternary + **switch** |

## Recipe insights harvested this wave

Three of these flipped functions that first read as allocator/scheduling walls
— worth adding to the library because they are *source-reshapeable* on Windows:

1. **RETURN-VALUE-NOT-VOID** (`021aaa88` / `021aace4`, 92% → 100%). A tail
   `*p += f() << k` where the orig keeps `r0` (= `f`'s return) live all the way
   to `ldmia` means the function **returns that value**. Declaring it `void`
   let mwcc put the accumulate result in `r0` (clobbering the return) instead
   of reusing the reloaded `*p` reg (`r1`). The "1-instruction allocator miss"
   was a missing return type. *Check the orig's final `r0` before assuming
   void.*

2. **OPERATION-ORDER controls allocation** (`021ab054`, 91% → 100%). Two
   sibling stores after a call — a flag `|= 2` and a zero-store — came out with
   the flag loaded into the wrong reg. Writing the flag RMW **before** the
   zero-store in source (even though mwcc reorders the actual stores) made the
   zero materialize first and land in the reg reused for the `orr` result.

3. **DIRECT-ADDRESS > bound-local for an MMIO base+offset pair** (`021accc8`,
   78% → 100%). Binding `int *io = (int*)0x4000000` and using `io[0]` /
   `io+0x1000` cost an extra callee-saved register and permuted the whole tail.
   Inlining the two constant addresses (`*(int*)0x4000000`, `*(int*)0x4001000`)
   let mwcc reuse the base with `add r2,r1,#0x1000` and pick the orig
   registers.

4. **UN-BIND a base that's dead across the call-heavy middle** (`021accc8`,
   35% → 78%, prerequisite for #3). Binding `snd = data_..ad860` (used only at
   the top and tail) kept it callee-saved across the divmod + two MMIO calls,
   burning a register the orig didn't. Inlining it forced the orig's tail
   re-load.

5. **SWITCH for out-of-line case bodies** (`021aaaf0`, 84% → 100%). An
   `if (s==0xc || s==0xe) {A} else if (s==0xf) {B}` lays body `A` inline (`bne`
   to skip). The orig places **both** bodies out-of-line (`beq` forward to
   them) — that is `switch` codegen. Rewriting as `switch { case 0xc: case
   0xe: A; case 0xf: B; }` reproduced the `cmp/cmpne/beq`-to-forward-body
   layout exactly.

Recipes that transferred unchanged: bind-struct-base-to-local (every
`oam+0x9b4` op), the `OamCtl` 1-bit u16 bitfield for the `lsl#31;lsr#31` bit-0
extract, `(u16)x` cast for the priority nibble, `func_020b3870` divmod
(quotient r0), and the `func_0207f934` cell-config draw.

## Deferred — Mac/permuter tier

| func | % | why | tried |
|---|---|---|---|
| `021ace14` | 77 | fn-ptr step dispatcher; mwcc pools `data_021040ac+0xb6c` ([r,#0]) vs orig `[base,#0xb6c]` | 3 forms (RMW / char* / read-temp) all pool |
| `021aaa3c` | 63 | cell-attr forwarder; +0x66/+0x900 adds split & interleaved by scheduling, u16 in r2 vs r0 | bind-base 52→63, rest scheduling |
| `021aa9b8` | — | angle→cell tail-call; magic-multiply signed div (/60 then /17) + +0x66/+0x900 split | not attempted (magic-const = permuter) |
| `021ad118` | — | two-loop min/rescale (0xdc), dense | not attempted (future wave, not a wall) |

The wave hit ~12 cleanly with the easy/clean tier still productive — `021ad118`
is a plausible wave-2 seed, but `021ace14` / `021aaa3c` / `021aa9b8` are
allocator/scheduling/magic-divide and belong to the Mac permuter backlog.

## Verify recipe (per pick)

```
write .c  ->  append `complete .text start..end` to the ov018 delinks.txt (CRLF)
          ->  python tools/configure.py eur
          ->  rm objdiff.json          # .resolved staleness trap
          ->  ninja sha1 ; ninja report
          ->  read fuzzy_match_percent from build/eur/report.json
```

Gotcha confirmed this wave: the `<0x100` gap-size estimate (next-gap-func minus
this-func) **over-counts** when already-matched functions sit in the span —
`021aace4` looked 0xf8 but the real next boundary was the matched `021aad64`
(0x80). Always clamp the delinks `end` to the next *boundary*, matched or not.
