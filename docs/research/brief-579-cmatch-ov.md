[//]: # (markdownlint-disable MD013)

# Brief 579 - C-match overlay sibling families (readable-C chapter, wave 1)

Branch: `claude/cmatch-ov-579`

Scope: the brief-564 census's 6 overlay sibling-family rows
(`docs/research/campaign-analytics/cmatch-sweep-queue-overlays.md`) —
byte-coverage is done; this opens the readable-C frontier (~8%). Unlike
the VRAM/table-walker lanes, none of these families have a byte-matched
anchor — every exemplar had to be cracked from scratch before any
propagation was possible.

## Outcome

| # | Family | Exemplar | Result | Siblings |
|---:|---|---|---|---|
| 1 | ov020 parameter-pack sibling quad | `021ab964` | **matched** | 2/2 matched (`021aba54`, `021abac0`) |
| 2 | RGB555→HSV min/max sibling pair | `021ada74` | **matched** | 1/1 matched (`ov022:021ab4b0`) |
| 3 | HSV/RGB magic-multiply | `021adb8c` | **matched** | none queued (others already-attempted) |
| 4 | Cross-overlay 472B dialog-setup pair | `ov009:021aaaec` | **parked** | not attempted (would share the wall) |
| 5 | ov017/ov019 divmod-pack siblings | `021b7dac` | **parked** | not attempted (byte-identical shape, would share the wall) |
| 6 | ov010/ov015 double-switch | `021b32ac` | **matched** | none queued (sibling already-attempted) |

**7/7 attempted exemplar+sibling matches landed at EUR objdiff 100%,
ported to USA+JPN, all three regions' `ninja sha1` green.** 2 of 6
families (4 and 5) hit genuine, well-diagnosed near-miss walls at the
exemplar and were parked per the brief's explicit instruction, rather
than forced or left in a broken state.

## Per-family detail

### Family 1 — ov020 parameter-pack sibling quad (3/3)

Dossier existed for all 3 (`docs/research/c-match-prep/021ab964.c` +
siblings) but was flagged low-confidence. The dossier's `r3` (4th call
argument to `func_ov020_021aa8f0`) was modeled as a literal `0`; the raw
`.s` shows `add r3, sp, #0x8` — an **address**, not a scalar. Reading the
disassembly directly (not trusting the dossier's own draft) showed the
real 4th argument is a pointer to a 2-word local array the caller
assembles on its own stack (`{0xc000, packed}`), with 2 more scalar args
pushed separately. Fixed signature:
`func_ov020_021aa8f0(int a0, int a1, int handle, int *info, int a4, int a5)`.

First draft (dossier's raw `*(int*)(data+off)` pointer-cast deref) hit a
59% ceiling — mwcc hoisted the literal-pool load and fragmented the
packed-value register, matching the dossier's own documented
"reg-alloc walled" risk note. **Lever**: replacing the cast-arithmetic
deref with a typed struct + field access (`data.field` instead of
`*(int*)(ptr+off)`) fixed it on the first retry. Siblings propagated
zero-shot — only the offset, the `info[0]` constant, and
`func_0207e638`'s 2nd argument differ per member.

### Family 2 — RGB555→HSV min/max sibling pair (2/2)

No dossier. The RGB555→HSV inverse of family 3's HSV→RGB function,
decoded directly from `.s`. Two stacked levers, neither obvious from a
first read:

1. The disassembly re-computes `cmp(R, G)` **twice** — once to decide
   the outer `max(R,G) vs B` branch, again inside the branch body. That
   redundant recompute is the signature of a `MAX3`/`MIN3` macro
   expanding to nested ternaries with the inner `(r>g)?r:g` written out
   **twice textually** rather than bound to a shared temp — mwcc doesn't
   CSE across the two textual occurrences. Writing
   `(((r>g)?r:g)>b) ? ((r>g)?r:g) : b` literally (deliberately not
   factoring out the repeated ternary) reproduced the redundant compare
   and closed most of a 44-byte gap (34%→98.6%).
2. The remainder was a "trust the pointer, not the local" issue: the
   original reloads `V` and `S` through their **output pointers**
   (`ldr r1,[r8]`) at every later use point rather than keeping them
   live in a register. Replacing every later `v`/`s` reference with
   `*v_out`/`*s_out` closed the rest, one instruction at a time, to 100%.

Sibling (`ov022:021ab4b0`) is a byte-identical clone body (confirmed via
`diff` against the exemplar's original `.s` before matching it) —
zero-shot 100% with just the function name changed.

### Family 3 — HSV/RGB magic-multiply (1/1)

Dossier existed but explicitly flagged low-confidence/permuter-class
("8-smull scheduling interleave is a coin-flip") and admitted its own
`.L_260` pack tail was "truncated/inferred." Reading the full raw `.s`
showed the dossier's assumed `PackRGB555()` helper call doesn't exist —
it's **inline** clamp+pack code — and the `default` switch case sets all
three outputs to `0` (not `r0=sector` as guessed).

First draft (correct switch/case logic, dossier-style expressions)
landed at 25% with a function-wide register-allocation cascade. Root
cause: I'd expanded the modulo as `hh - (hh/360)*360`, which mwcc
recognized as a plain re-multiply and compiled to a cheap 32-bit `mul`
— the original uses a full 64-bit `smull` there, meaning the real source
used `%` directly (mwcc's modulo codegen differs from its optimized
re-multiply codegen even though they're mathematically identical).
Switching to `hh % 360` turned 25%→100% in one move; everything else
was downstream drift from that single instruction choice.

### Family 4 — cross-overlay 472B dialog-setup pair (parked)

No dossier — the largest, most complex function attempted (472 bytes, a
3-way switch feeding a 2-iteration loop with alternating hit-test
windows). No prior byte-matched anchor and no sibling similarity to lean
on beyond a loosely-related shape (the sibling isn't a byte-identical
clone — different struct offsets by a consistent -0x8, different
case-comparison values).

Two substantial, independently-reasoned drafts:

- **Draft 1** (initial, partly speculative bit-packing logic for the
  loop body): 41.5% match, but landed on the **exact right total size**
  (472/472) — a genuinely useful signal that the overall instruction
  *count* was right even though several individual computations weren't.
- **Draft 2** (carefully re-derived the loop's packed-word bit math and
  the `toggle` field from the raw disassembly, fixing real bugs in draft
  1): regressed to 27%. The blocker: my stack frame allocates `0x24`
  bytes where the original uses only `0x10` — despite my locals living
  in mutually-exclusive `if`/`else`/loop-iteration scopes that should be
  reusable, mwcc isn't reusing stack slots across them the way the
  original's structure does. That one gap cascades into nearly every
  downstream register choice.

**Diff-type: contained-but-structural — a stack-slot-reuse-across-scopes
gap, not a register-allocation coin-flip.** Distinct from family 5's
wall (a scheduling/predication choice); this one looks solvable with
more insight into what specific C shape gets mwcc to alias stack space
across disjoint blocks, but that insight wasn't found within a
reasonable attempt budget given 5 other families/porting/report work
still pending. Reverted cleanly (`git checkout --`), original `.s` and
`kind:function` symbol untouched. Not attempted further; the sibling
(`ov016:021b5dd0`) was not attempted independently since it shares the
same fundamental shape and would very likely hit the same wall.

### Family 5 — ov017/ov019 divmod-pack siblings (parked)

Dossiers existed for both, correctly capturing most of the logic but
with one real error each: the dossier assumed `func_02005dac` took 3
args including a stack-buffer pointer; the raw `.s` shows it takes only
2 (`int a`, `int b`) — no buffer pointer at all, confirmed by the
absence of any `r2` setup before that specific `bl`.

After fixing the signature, structure and constants all matched, but one
early guard check (`if (self->f4 != 1) return early;`) consistently
compiled to a **predicated** conditional load (`ldreq`/`cmpeq`) instead
of the original's **unconditional branch** to a shared tail. Four
genuinely distinct C structurings were tried:

1. Fused `&&` (`if (a==1 && b==1) {...}`)
2. Nested positive-condition `if`s with a single trailing `return`
3. Explicit `goto end;` to one shared label
4. More granular intermediate temp variables around the guard

**All four produced byte-identical codegen for the guard** (mwcc
evidently canonicalizes 1–3 to the same internal form before scheduling,
and #4 didn't change anything) — except a fifth variant (two independent
`if (cond) return 1;` statements) which went the *other* direction and
duplicated the epilogue instead of branching to a shared tail. Checked
`docs/research/reshape-recipes/` first (Recipe 5, "short-circuit
condition-code lowering") — it documents exactly this predicated-vs-
unconditional class of divergence, but only the opposite direction
(naive draft too unconditional, needs `&&` to *add* predication); this
case needed the reverse and none of the standard techniques reproduced
it.

**Diff-type: genuine instruction-scheduling wall — mwcc's own
predicate-vs-branch heuristic for a cheap 2-instruction guarded body,
not controllable via the C-level restructurings tried.** Best result:
69.2%, contained to the guard region (rest of the function, once
reached, matches exactly what family-3-style reshaping would produce).
Reverted cleanly. The sibling (`021b5948`) is confirmed **byte-identical
in body** to the exemplar (only constants differ) — since the exemplar's
wall is in shared, constant-independent guard logic, the sibling was not
attempted separately; it would hit the identical wall.

## Did the in-loop feedback hook help?

**Short, honest answer: the hook itself works correctly, but its output
never reached me automatically in this session — so functionally, no,
it didn't provide the "free" speed-up it's designed for.**

What I found: `.claude/hooks/post_edit.py` (brief 566) is registered
correctly (`.claude/settings.json`'s `PostToolUse` matcher on
`Edit|Write|MultiEdit`), and when I manually fed it a synthetic
tool-call payload matching one of my real edits, it worked exactly as
designed — compiled the single TU, ran the direct-file objdiff, and
printed an accurate match percentage
(`[post-edit-hook] eur compile OK, func_ov020_021ab964 match: 100.00%`)
in well under a second. I verified this against several of my edits
during this brief and it was accurate every time I checked it by hand.

**But I never once saw this output appear automatically after an Edit
or Write tool call during this session** — no hook output surfaced in
the tool result stream the way a PostToolUse hook's stdout normally
would. I only discovered it was working at all by manually re-invoking
it with a constructed JSON payload partway through Family 1, out of
curiosity about why I wasn't seeing anything. From that point on I just
used the same direct `ninja build/<region>/<path>.o` +
`objdiff-cli diff -1 ... -2 ...` sequence I'd have used without the
hook — which is exactly the workflow brief 566 built the hook to make
unnecessary.

This is worth investigating separately (harness/environment PostToolUse
delivery, not a defect in the hook script itself — the script is
demonstrably correct when invoked). Flagging as a follow-up rather than
fixing here, since brief 579's own scope is the C-match work, and
diagnosing *why* a hook's stdout isn't surfacing in this particular
session is a different, harness-level question from what the hook
itself does.

## Porting

All 7 matches ported EUR→USA+JPN via `port_to_region.py`. 6 of 7 needed
`--confidence-floor MEDIUM` (default is HIGH) — in every case the
refused symbol was a **callee** my matched function calls, not the
matched function itself, resolved via the tool's own "D2 v2 auto-promote
LOW→MEDIUM" neighbor-consensus mechanism rather than an exact reloc
match. Accepted the override and let each region's own `ninja sha1` be
the real arbiter of correctness (per-region gate, not the confidence
heuristic) — all three regions passed clean.

One port needed a manual fix beyond what the tool could do automatically:
`func_ov010_021b32ac` calls `Task_Invoke`, an already-friendly-renamed
EUR symbol with no address embedded in its name.
`port_to_region.py`'s symbol resolution is scoped to address-based
`func_<addr>`-shaped names (by design — same limitation surfaced in
[the sig_census brief](brief-569-sig-census.md)), so it copied
`Task_Invoke` verbatim into both ports, producing a real
`Undefined: "Task_Invoke"` link error in USA. Resolved by hand: found
`Task_Invoke`'s EUR address (`0x02006e1c`), cross-checked the region
shift via its still-address-named neighbors `Task_PostLocked` /
`Task_InvokeLocked` (both USA and JPN: exactly `-0x1c` from EUR, and
identical to each other), and confirmed `func_02006e00` (same 0xc-byte
size) sits at the shifted address in both USA's and JPN's `symbols.txt`
— the correct, not-yet-renamed target. Both ports fixed identically;
`ninja sha1` green in both regions afterward.

## Verification

```text
$ python tools/gate3.py --no-tests
...
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

Each family's exemplar and every sibling was individually confirmed at
EUR objdiff 100% (`objdiff-cli diff -1 <delink>.o -2 <built>.o <symbol>`)
before being ported; each port was confirmed against its own region's
real `ninja sha1`, not just the port tool's own confidence report. Both
parked families were reverted with `git checkout --` (delinks.txt and
the original `.s`) before moving on — `git status --short` clean on
those paths, no half-applied state left behind.

## What's next

- The 2 parked exemplars (family 4's stack-slot-reuse gap, family 5's
  predication-vs-branch wall) are genuine, well-diagnosed near-misses,
  not under-explored — worth a fresh pair of eyes or a permuter-class
  tool rather than more manual C reshaping in the same style.
- The hook-delivery question (§ above) is worth its own investigation
  before the next C-match wave leans on it for speed.
- 5 more sibling-family rows remain unexplored beyond this brief's
  6-family census slice — brief 564's queue was scoped to exactly these
  6; a fresh census pass would be needed to find the next batch.
