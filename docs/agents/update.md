# Updating to a pinned framework release

Written for a Worker (or Verifier) carrying out the round that moves this
project from its currently-recorded framework release to a different,
pinned one. Brain writes the brief the same way it writes any other; this
document is what that brief points at.

## How a project learns a release exists

**The owner relays it.** Whether that is checking the framework repository
directly, a message from another project's Brain, or anything else, is the
owner's choice of channel — this document does not prescribe one, and this
project does not poll or watch for new releases on its own. What arrives is
always the same shape: "update to release `<X.Y.Z>`", naming the framework
repository's pinned tag or commit to move to.

## This is an ordinary reviewed round — never mid-round

Updating the framework changes what the installed guards enforce and what
every role's contract says, which is deep-review territory under
[`CONSTITUTION.md`](CONSTITUTION.md)'s *Proportional review*. It is briefed,
executed, reviewed and merged exactly like any other change — never a hook,
never something Brain applies unilaterally as trivial housekeeping, and never
something an agent starts on its own initiative.

**Never start this while a round is in flight.** Check this project's
`docs/briefs/active.md` (or its equivalent) and the shared completion-report
inbox first. If a brief is out and unadjudicated, finish or explicitly park
that round before starting an
update — an update landing mid-round can change the very tools and contracts
the in-flight round is being executed or reviewed against.

## What moves together

The canonical documents and installed tools are one versioned surface. Moving
only part of it leaves a mixed state that can report findings caused by the
framework's old copies rather than by project-authored text, or make a new
delivery or line-ending rule unavailable. Move all of the following in one
change:

1. Every document under `docs/agents/` that the project's adoption installed
   — the complete set is the framework repository's `tools/adopt.py`'s
   `VERBATIM_DOCS` at the target release; in practice, every file already
   present under `docs/agents/` in this project.
2. The baseline installed tools: `tools/checkout.py`, `tools/report.py`,
   `tools/line_endings.py`, and their tests `tests/test_checkout.py` and
   `tests/test_report.py`.
3. When the optional neutrality guard is installed (`tools/neutrality.py`
   exists in this project): `tools/neutrality.py`, `tools/textblocks.py`,
   `tools/authority.py`, and `tests/test_role_neutrality.py`.
4. The installed root `.gitattributes`, and `.githooks/pre-push` if this
   project opted into that hook.
5. This project's recorded framework repository address and release —
   `AGENTS.md`'s "Framework" section.

**Never move:** `AGENTS.md`'s judgement content (topology, invariants,
evidence table, enforcement statement), `docs/state.md`, `docs/briefs/`, or
any other project-authored file. Those are this project's own content, not
copies of anything upstream, and an update does not touch them except where a
release's changelog entry explicitly calls for a specific migration step —
see below.

## Procedure

### 1. Obtain the framework repository at the pinned release

Fetch or clone the framework repository this project's `AGENTS.md` records,
at the release the brief names — a tag if one exists at that release, a
commit if the owner named one directly. Do not tag anything yourself in the
framework repository; consuming a tag someone else created is not the same
act as creating one.

### 2. Read what changed

Read the framework repository's `CHANGELOG.md` for every release entry
between this project's currently-recorded release (exclusive) and the target
release (inclusive). Each entry states what changed, why, and what an
adopter must do. Follow the "what an adopter must do" steps for every entry
in that range, not only the newest one — skipping an intermediate release's
migration step because a later one's diff looks larger is how a project ends
up on new tool code with an old assumption still baked into its own files.

### 3. Reconcile each moved file — never blind-overwrite

For each file in "What moves together" above:

- If this project's copy is byte-identical to the *previous* pinned
  release's copy (i.e., nobody has hand-edited a file this framework
  documents as copied verbatim), replace it with the target release's copy.
  This is the ordinary case.
- If this project's copy has diverged from the previous release — someone
  edited a file this framework distributes as verbatim, which should not
  happen but sometimes does — do **not** silently overwrite it. Diff the
  two, and reconcile by hand: real project-specific need almost always
  belongs in `AGENTS.md` or another project-owned document instead of a
  file this framework redistributes on every project, not in a
  divergence carried silently through every future update. Record what
  the divergence was and how it was resolved in the round's evidence.
- A file present in the target release that this project's adoption never
  installed (for example, `tools/neutrality.py` when neutrality was
  deferred with `--no-neutrality`) stays absent; do not newly install an
  optional guard as a side effect of an update the brief did not ask for.

### 4. Update the recorded release

In `AGENTS.md`'s "Framework" section, set the recorded release to the one
just installed. This is the only part of `AGENTS.md` this procedure changes
on its own; every other section is this project's judgement, untouched.

### 5. Check line endings

A `.gitattributes` update does not retroactively rewrite an unchanged working
file. From every checkout in this clone that can run a framework command,
follow [`git-and-isolation.md`](git-and-isolation.md)'s stash-free procedure:

```
python3 tools/line_endings.py check
python3 tools/line_endings.py refresh
git diff --check
git diff --cached --check
```

Review the staged diff before committing, then commit only the intended
normalisation. A separate clone has its own Git index and must be checked
there independently; this step cannot inspect another clone.

### 6. Validate

Run the project's full test suite. If the optional neutrality guard is
installed, confirm it still passes against this project's declared roles,
and — the same way adoption itself proves the guard is real — introduce a
structurally invalid example into a normative document, watch the guard
reject it, then remove the example again.

### 7. Land it like any other change

Commit as focused, reviewed changes — not one giant commit mixing the
framework update with unrelated work. A Verifier reviews it exactly as it
would review any other round, at the exact head SHA. Brain adjudicates and
merges it through the normal acceptance path; an update is not exempt from
independent review merely because most of its diff originates upstream. The
CHANGELOG entries read in step 2, and any divergence reconciled in step 3,
belong in the round's evidence so the reviewer can check the same things
independently rather than trusting that they were read.
