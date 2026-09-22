# Briefs

A brief is the complete statement of one bounded task. It is written by Brain
and read cold by whoever executes it.

## The one rule that matters most

**Describe the problem, not the solution.**

The most likely failure of this framework is Brain writing briefs so detailed
that the executor becomes a typist and Brain becomes the real — and most
expensive — implementer. When that happens there is no independent execution
left to review, and the whole acceptance model is theatre.

A brief does **not** say "edit function X at line Y, add type Z, use algorithm
Q". If Brain has found a constraint that genuinely must be preserved, that is an
**invariant with its source**, not an instruction. State the constraint and let
the executor design around it.

This rule also applies to numbered corrections inside an adjudication. When
Brain must prescribe wording to preserve a constraint, it first checks that
carrying out every correction literally and together would leave no statement
false or contradictory.

## Template

```markdown
Brief-ID: <NNN-YYYY-MM-DD-slug>

## MODE: <IMPLEMENTATION | RESEARCH | SOURCE VERIFICATION | ADVERSARIAL AUDIT |
##        DATA / SCHEMA | REGRESSION INVESTIGATION | DOCUMENTATION>

## Goal
One paragraph. What must be true when this is done.

## Why this is next
The roadmap item, defect, or open question this closes, and why now.

## Base
The branch to cut from, and how to confirm the starting point.

## Relevant context
The specific documents and sources worth reading — and an explicit note on what
is *not* worth reading for this task.

## Scope
What this change may touch.

## Non-goals
Explicit "do not touch these", and adjacent work deliberately deferred.

## Protected invariants
The constraints this must not breach — with sources, so they can be checked
rather than trusted.

## Required investigation
Questions that must actually be answered from source, not assumed.

## Acceptance criteria
Observable, checkable outcomes. Not "works well".

## Required evidence
The exact commands whose real output must appear in the report.

## Git expectations
Branch name, and the reminder that the executor does not merge.

## Completion-report schema
Any additions to the standard report for this task.
```

`Brief-ID:` is the stable identifier for the round. Brain assigns it when the
brief is written, using the zero-padded sequence, date and slug, and never
changes it as the file moves through the lifecycle. It is the value passed to
`tools/report.py write --task`; `active.md` is only the current location and is
not an identifier.

## Design rules

**Bounded.** One coherent task. If two things can only be judged together, they
belong in one brief; if they can be judged apart, they are two.

**Self-contained.** The executor has no conversation history. Everything it
needs is in the brief or in a document the brief names.

**Neutrally framed for anything investigative.** State the question, not the
answer you expect. "Establish whether X holds" — not "confirm that X holds". A
leading brief produces a confirming report, and a confirming report is worthless
as evidence.

**Explicit about non-scope.** The most common scope drift is an executor fixing
something adjacent and real. Naming it as deferred prevents that without
pretending it does not exist.

**Explicit about what stopping looks like.** If the answer is genuinely ambiguous
and a wrong general rule would cause systemic damage, the executor is authorized
to stop and present options. Say so in the brief.

## Do not over-fragment

Artificially tiny briefs are their own failure. Each one costs a dispatch, a
review, an adjudication and a state update — and management overhead can easily
exceed the work.

When several tightly related tasks can be judged coherently together, combine
them. The test is whether one review can sensibly accept or reject the whole
thing: if yes, it is one brief.

## Brief hygiene

- Assign the sequence number when the brief is written; it never changes.
- Keep the brief as it was actually received. Amendments are appended, not
  edited in.
- Move it through the lifecycle states in [`lifecycle.md`](lifecycle.md) — and
  never into the archive before it has been adjudicated.
