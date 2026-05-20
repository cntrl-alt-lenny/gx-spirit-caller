### cloud/pattern3-subsumed-ref-resolution

**Goal:** Fix the structural collision between Pattern 3
chunks and brief 155's bundle TUs that brief 158 (PR #589)
surfaced. The bundle recipe hides inner placeholder symbols
inside a `unsigned int[N]` array; downstream Pattern 3
chunks that need to reference those inner symbols fail with
`Undefined : "data_021017f4"` at link time.

**Context — what brief 158 documented:**

Brief 158 wave 2 hit a hard collision with `data_02101928`
in main:

> The 13th candidate (`data_02101928`, 0x3f8 bytes) failed
> at link with `Undefined : "data_021017f4"` — its `.word
> data_021017f4` reference can't resolve because
> `data_021017f4` is a subsumed placeholder inside brief
> 155's bundle `data_021017f0[3]` TU (spanning
> 0x021017f0..0x021017fc).

The bundle recipe forces non-zero `.data` emission (its
purpose, per brief 152/155), but exports only the leading
symbol (`data_021017f0`). Inner addresses (`021017f4`,
`021017f8`) are invisible to the linker even though they
contain real data inside the bundle's byte range.

Brief 158 listed 3 workaround sketches:

1. **Generator emits `.word data_021017f0 + 4` syntax** for
   subsumed-placeholder references (compute offset at
   generation time).
2. **Bundle TUs export inner placeholders** via `.global
   data_021017f4` aliases at the right offsets within the
   bundle source.
3. **`patch_module_literals.py` extended** to handle `.word`
   (not just `kind:load`) post-link relocs.

**Brief 161 deliverables:**

### Recommendation: Sketch 2 (bundle alias export)

Sketch 2 is the cleanest because:

- **No generator change** required. Pattern 3 generator's
  `.word <name>` emission stays as-is. Brief 158 ships
  `.word data_021017f4`; once `data_021017f4` is exported as
  a `.global` alias at offset +4 within the bundle, the
  linker resolves it.
- **No post-link patcher change** required. The relocation
  resolves at link time, not post-link.
- **Generic** — works for any future bundle/chunk collision,
  not just D-3.

Sketches 1 + 3 are noted as fallbacks if Sketch 2 doesn't
work for some empirical reason.

### Part 1 — Bundle alias export helper

Add a small helper (in a new `tools/cluster_b_bundle.py` or
extending an existing tools/ module) that:

1. Takes a bundle's anchor address + size + list of
   subsumed-placeholder symbols (with their relative offsets
   into the bundle).
2. Emits a `.c` source variant that:
   - Defines the bundle as before (`unsigned int <anchor>[N]
     = {…};`).
   - **Adds `extern unsigned char <placeholder>[];`** + the
     placeholder symbol as a labeled offset.

   The mwcc-friendly shape for offset aliases is the GNU
   `__attribute__((alias("<anchor>")))` pattern — verify mwcc
   2.0/sp1p5 honours `alias` attribute. If not, fall back to
   plain `.s` chunk that explicitly labels each offset with
   `.global` directives (Pattern-3-style, per brief 153
   precedent).

### Part 2 — Convert `data_021017f0` bundle as worked example

Brief 158 left `data_02101928` skipped. Rewrite the bundle
TU at `src/main/data/data_021017f0.c` (or whatever brief 155
emitted) so that `data_021017f4` is exported. Then verify
that `data_02101928`'s `.word data_021017f4` reference now
resolves at link.

**Optional**: ship `data_02101928` as a Pattern 3 chunk in
this PR too — the brief 158 candidate decomper had to defer.
That validates the bundle-alias fix end-to-end. If too much
scope creep, leave as decomper brief 162+ application.

### Part 3 — Tests

- 1-2 regression tests pinning the bundle alias emission
  shape against a known fixture.
- The full project test suite still passes (1808+ baseline
  post-brief 159).

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (worked example's
  bundle rewrite must not change emitted bytes).
- All existing + new tests pass.
- Markdownlint clean on any new docs.

**Non-scope:**

- ❌ Other generator improvements beyond bundle-alias fix.
- ❌ ov004 reclassification (brief 160 territory).
- ❌ Cluster D-3 wave 3 (decomper, post-merge).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Bundle alias mechanism shipped (either `alias` attribute
  or `.s` rewrite).
- `data_021017f0` bundle exports `data_021017f4` (and any
  other subsumed placeholders in that range).
- Optional: `data_02101928` ships as Pattern 3 chunk
  end-to-end.
- 3-region SHA1 PASS preserved.
- Regression tests pin the new shape.

**Branch:** `cloud/pattern3-subsumed-ref-resolution`

**Priority:** MEDIUM. Unblocks D-3 wave 3's `data_02101928`-
class candidates (likely 1-3 more in remaining pool); not
critical-path.

**After this brief lands:**

1. Decomper brief 162+ can apply the bundle-alias mechanism
   to any other bundle/chunk collision discovered in future
   waves.
2. D-3 wave 3 (decomper, if brief 158's residue is worth a
   wave) ships `data_02101928` + `data_020c9694` (14.8 KB
   mega) + `data_020c7b44` (4.9 KB) + other recent-decline
   candidates.
3. Cluster B's bundle recipe gets a "subsumed-export" knob
   for any future cluster work that needs to absorb already-
   bundled neighbours.
