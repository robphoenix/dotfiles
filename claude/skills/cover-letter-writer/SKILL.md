---
name: cover-letter-writer
description: |
  Write or revise cover letters, "why this role" / "why this company" application
  sections, and other short job-application interest statements. Trigger whenever
  the user is applying for a job and wants a cover letter drafted or edited, or a
  shorter motivation/interest paragraph for an application form — even without the
  words "cover letter," e.g. "write my interest section for this," "draft why I
  want this job," or "turn this JD into an opening paragraph for me." Always ground
  every claim in the job posting provided and the user's actual, confirmed
  background — never invent a skill, tool, or achievement the user hasn't stated.
---

# Cover letter and application-interest writing

A cover letter's job is to show one specific person has read one specific job
posting and actually fits it. Most AI-drafted cover letters fail at this: they
restate the person's CV, praise the company in generic terms, and could be sent
to any employer with a find-and-replace. This skill exists to avoid that.

## Bundled resources

- `references/background.md` — the user's LinkedIn About section, their most
  recent role's experience bullets, and a running list of scope/fact notes
  established in past conversations (e.g. tools they don't use, work they're
  not interested in). Read this before drafting anything.

## Before writing: gather the two inputs

You need both of these before drafting anything:

1. **The target job posting or role description**, in enough detail to identify
   2–4 concrete things it actually emphasizes (a named problem, a specific tool
   or stack, a team structure, a stated priority). If the user hasn't provided
   this, ask for it or search for it rather than guessing at a generic version
   of the role.
2. **The user's real background** for this application — what they've built,
   the tools they use, their title and company. Start from
   `references/background.md`, which holds the user's LinkedIn About section
   and their most recent role's experience bullets, kept in their own words.
   Treat it as the default source of truth for what they've actually done.
   If the current conversation gives newer or more specific detail (a fact
   from memory, a correction, a detail about this particular application),
   that takes priority over the reference file, and offer to update the file
   with it. Do not invent or infer a skill, tool, certification, or years of
   experience beyond what's in the file or the conversation, just because the
   job posting asks for it.

If the job posting asks for something the user hasn't confirmed (a language,
a platform, a certain kind of experience), don't assume either way — ask one
direct question ("Do you use TypeScript?" not "Please confirm your full tech
stack") and wait for the answer before including it.

## Structure: full cover letter

- **Opening**: Engage directly with one specific, real thing the posting says
  — a problem it names, a priority it states, a phrase it uses — and connect
  it to something the user has actually done. Skip generic enthusiasm ("I am
  excited to apply for...") as the opening move; earn the enthusiasm by being
  specific first. If the posting or company names their own internal system
  or tool (a design system name, a product name), use that actual name
  rather than describing it generically — it signals the letter was written
  for this company. If the posting or company materials give a real number
  (customer count, deploy frequency, team size), use it in place of vague
  scale language ("at your scale") — but only a number that's actually
  given, never an invented or estimated one.
- **Body (1–3 paragraphs)**: Map the user's real experience onto what the
  posting asks for, in the user's own terms. Prefer flowing prose over bullet
  lists of skills, and never format skills as bold mini-headings — this is
  one of the more obvious AI-writing tells and reads as a keyword-matching
  exercise rather than a letter from a person.
- **Closing**: One sentence that invites the conversation forward. Avoid
  inflated sign-offs like "shape the future of your product" — end on the
  actual, specific thing you'd talk about.
- **Salutation and sign-off**: match the user's stated preference, or default
  to something regionally appropriate (see Localisation below).

## Structure: short "interest" section

Application forms often just want a few sentences answering "why this role"
or "why this company" — no salutation, no closing, sometimes a character
limit. Use the same rules as above (specific engagement with the posting,
the user's real background, no invented facts) but compress to 2–5 sentences
and drop the letter framing entirely.

## Facts and honesty rules (critical)

- Every tool, methodology, and claim of experience must trace back to
  something the user told you, not something the job posting merely
  mentions. If in doubt, flag it rather than including it: state the gap in
  one short line and ask, don't quietly omit it and don't quietly add it.
- Preserve the user's own established terms and phrases exactly (a personal
  phrase they've used before like "force multiplier," a project name, a
  specific technology). Don't paraphrase away a deliberate word choice.
- When the user asks for a small, surgical edit — swap one phrase, cut a
  clause, change a word — make exactly that change and return the complete
  letter again in full, not just the edited sentence. The user needs a
  clean, copy-pasteable document after every round, not a diff.
- Don't stretch to use the job posting's exact wording everywhere; that reads
  as keyword-stuffing. Use it where it names something genuinely true of the
  user's background, and use the user's own phrasing elsewhere.

## Voice and style rules

- First person, active voice, plain sentences. Vary sentence length; don't
  fall into an even, mid-length AI cadence.
- No résumé clichés ("Pioneered," "Spearheaded," "Instrumental in"), no
  inflated intensifiers ("seamlessly," "drastically," "deeply committed"),
  no formulaic sayings ("bridge the gap," "shape the future of," "the engine
  behind").
- Avoid "X isn't just Y, it's Z" and other clipped not-X-but-Y constructions
  ("not just a UI library; it's the engine behind..."). These have shown up
  in earlier drafts and read as inflated rather than specific — state
  directly what the thing does or is.
- Never format the body as a bulleted list with bold mini-headings (e.g.
  **Developer experience:**, **Governance:**). This has slipped into earlier
  drafts too; it reads as a keyword-matching exercise, not a letter. Fold the
  same content into prose instead — see Body, above.
- No em dashes unless the user's own writing sample uses them.
- Always run the `humanizer` skill on the full draft before delivering it,
  no matter how clean the draft already looks. Load it, apply its full
  rewrite process (mark patterns, draft, check against its two questions,
  finalize), and confirm no fact was added, lost, or changed in the process.
  This is a required last step for every letter and every revision, not an
  optional cleanup pass.

## Localisation

Always use British spelling and register (organisation, specialise, colour,
programme), regardless of where the target company or role is based. Watch
for idioms that read as American even in otherwise correct prose —
"routing every decision through one person" reads as an Americanism to a
British ear; "every decision having to go through one person" doesn't.

## When the user gives feedback

Treat corrections the way you would in an editing session, not a one-shot
generation: apply exactly the change requested, don't re-litigate earlier
decisions the user already made, and don't re-introduce a pattern they've
already asked you to remove earlier in the same letter.
