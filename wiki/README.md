# `wiki/`

Canonical source for the GitHub wiki at
<https://github.com/cntrl-alt-lenny/gx-spirit-caller/wiki>.

## How it works

- Every `*.md` file in this directory becomes a wiki page.
- Filenames use dashes; GitHub renders them as spaces in titles
  (e.g. `Matching-Workflow.md` → "Matching Workflow").
- `Home.md` is the landing page.
- `_Sidebar.md` renders on the right of every wiki page.
- `_Footer.md` renders at the bottom of every wiki page.
- On merge to `main`, `.github/workflows/sync-wiki.yml` pushes the
  contents of this directory to the wiki's `master` branch.

## Editing

1. Edit or add files here on a feature branch.
2. Open a PR against `main`.
3. On merge, the workflow syncs to the live wiki within a minute.

**Do not edit the GitHub wiki UI directly** — direct edits will be
overwritten the next time the workflow runs.

## Adding a page

1. Create `New-Page-Title.md` in this directory.
2. Add a link to it in `_Sidebar.md` under the appropriate section.
3. Cross-link from relevant pages where it makes sense.
4. PR as usual.

## Internal links

Use bare page names, not paths or `.md` extensions:

```markdown
See [Matching Workflow](Matching-Workflow) for the inner loop.
```

GitHub's wiki resolves these relative to the wiki root.
