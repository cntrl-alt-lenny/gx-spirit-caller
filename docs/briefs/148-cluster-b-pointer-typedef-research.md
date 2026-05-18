### cloud/cluster-b-pointer-typedef-research

**Goal:** Unblock cluster B's pointer + size-1/2 sub-pools. Brief
143 wave 2 (PR #569) drained cluster B's size=4 W6-eligible true
scalars to floor; **~35-50 candidates remain** in the cluster B
pool but need recipe research before decomper can ship them.
Decomper's PR #569 closing notes named *pointer typedef research*
as the explicit gating dependency.

**Context:**

Cluster B is a `.data` sub-pool defined in brief 117 / brief 123
v3. The brief 143 wave 1 (PR #561) + wave 2 (PR #569) chain
shipped **174 true-scalar claims** (60 + 114) using the simple
`int data_<addr> = 0x<value>;` recipe under the W6 cascade filter
(size=4, addr%4=0, value!=0).

Remaining cluster B pool (per decomper's PR #569 funnel, ~35-50
candidates):

| Sub-pool | Count | Recipe blocker |
|---|---:|---|
| size=4 W6-rejected (unaligned or zero-valued) | 21 | needs `.s` recipe (for unaligned) or BSS handling (for value=0) |
| size=1/2 scalars | ~14 | recipe TBD — likely `unsigned char` / `unsigned short` direct decl, but signedness + alignment unverified |
| Pointer slots (4-byte but contents are addresses, not scalars) | ~10-20 | **needs pointee typedef research** — what struct/function does each pointer point at? |

Cluster A wave 4 (brief 139) and Pattern 3 (briefs 125 / 144)
covered analogous pointer slots in cluster A by emitting them
as `.word <name>` entries in `.s` chunks. For cluster B's main-
`.data` pointers, we don't yet know whether that same recipe
applies cleanly or whether the `.c` route (with a `typedef
struct { … } *` for each pointee) is required for SHA1 PASS.

**Scope (research, not implementation):**

Three deliverables:

1. **Pointer pool survey.** Enumerate the cluster B pointer
   candidates with: (a) the slot's vaddr, (b) the byte content
   at that slot (i.e. the pointed-to address), (c) the symbol
   the pointee resolves to per `arm9.map` / objdiff
   cross-reference, (d) the pointee's type if knowable from
   neighbouring matched code. Output as
   `docs/research/cluster-b-pointer-pool.md` (or extend
   `docs/research/cluster-b-classification.md` if that exists)
   with a candidate table. ~10-20 rows expected.

2. **Recipe choice + smoke test.** For 2-3 representative
   pointer candidates from the survey, write a Pattern 1 .c
   chunk emitting them as typed pointers (`typedef struct …
   *foo_t; foo_t data_X = (foo_t)0x021abcde;` or similar).
   Verify byte-identical output via objdiff + 3-region
   `ninja sha1` PASS. Iterate the recipe until one shape
   ships clean. Document the working recipe in the research
   note.

3. **Size-1/2 scalar recipe spot-check.** Lower priority — if
   the survey is quick, also try `unsigned char data_X = 0xAB;`
   and `unsigned short data_X = 0xABCD;` on 2-3 size-1/2
   candidates to confirm whether mwcc's natural emission matches
   without alignment hints. Report the result in the same
   research note as a separate section.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- **3-region `ninja sha1` PASS** preserved across the 2-3
  representative claims that this brief ships as worked examples
  (not the full ≥20-claim wave — that's brief 149 / decomper).
- All existing tests still green (1770+ baseline post-brief
  146).
- Markdownlint clean on the new research note.

**Non-scope:**

- ❌ Shipping the full ≥20-30-candidate cluster B wave 3. That
  would be **brief 149 (decomper)**, scoped after this brief's
  recipe lands.
- ❌ Touching `tools/` infrastructure beyond what's needed to
  run the survey (e.g. `tools/data_worklist.py` extensions are
  in-scope if they help the survey; `tools/cluster_c_pattern3_
  gen.py` Pattern 3 generator is OUT of scope — Pattern 3 is
  cluster-A-flavored).
- ❌ Cluster A / C / D-1 / D-2 work — those are ov004-flavored
  and handled by briefs 141 / 147.
- ❌ `AGENTS.md`, `docs/state.md`, or any decomper-owned path.

**Success:**

- Pointer pool survey landed at
  `docs/research/cluster-b-pointer-pool.md` (or equivalent).
- ≥ 1 representative pointer candidate ships as a worked example
  in the same PR with 3-region SHA1 PASS.
- Recipe documented clearly enough that decomper can mechanically
  apply it to the remaining ~10-20 pointers in brief 149.
- Size-1/2 spot-check ships in the same PR if cheap; deferrable
  to a follow-up note otherwise.

**Branch:** `cloud/cluster-b-pointer-typedef-research`

**Priority:** MEDIUM. Cluster B wave 3 is the natural next
decomper move once this lands. Not blocking brief 147 (which is
ov004-flavored, fully unblocked); decomper has brief 147 to chew
on while this research lands.

**After this brief lands:**

1. Brain scopes **brief 149 (decomper, cluster B wave 3)** with
   the recipe from this brief's research note. Same self-extend
   gate as 143 wave 1/2.
2. If the recipe also works for size-1/2 scalars per the spot-
   check, brief 149 covers both pointer + size-1/2 sub-pools
   in one wave.
