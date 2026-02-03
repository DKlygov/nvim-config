# Minimal NVIM config

## Why this configuration?

This configuration is a result of years of experience in software development.
During my programming journey, I had to work with various languages and tools
to get the job done. That also applies to code editors. I've tried (so far):

- Vim (no plugins)
- Neovim distributions
- VSCode
- IntelliJ IDEA (that unforgettable Java/Spring period, huh)
- Back to VSCode

And now I'm coming back to Neovim. But why?

Every editor I've used came with its own set of frustrations. Vim without plugins
was too raw for me at that time (lack of experience). Neovim distributions felt
bloated with features I never asked for. VSCode kept getting slower with every
update and extension. IntelliJ was great for Java, but try using it for anything
else and it becomes a resource-hungry mess. And going back to VSCode just reminded
me why I left in the first place.

What I really wanted was something fast, predictable, and out of my way. I don't
need my editor to be smart. I need it to open files, let me edit them, and not
lag when I type. That's it.

And no, this is not about the Neovim hype. If anything, this configuration is
the opposite of what the hype brought. I'm not here to show you a fancy dashboard,
a pile of plugins with beautiful UI, or a "look at my terminal" screenshot.
It's also *not* about productivity through keyboard-only workflows. That whole
narrative is a lie. You're not suddenly 10x faster because you don't touch a
mouse. And ricing your terminal to post it on Reddit is lame.

I've used VSCode with the vim plugin for years. I already knew the keybindings,
the modal editing mindset. So switching to actual Neovim wasn't some revelation
or lifestyle change. It was just a logical step: take what I already know and
remove the bloat around it.

## What do I use it for?

At the moment of writing, I'm consistently working on (both professional and
personal projects):

- Lua codebases
- Go codebases
- PHP codebases
- Node.js codebases
- A tiny bit of C
- SQL (PostgreSQL, MySQL, SQLite dialects)
- TOML, YAML, JSON configuration files
- Markdown docs

And this particular Neovim configuration covers it all.

The key word here is *properly configured*. I'm not saying you should use Neovim
with zero configuration. That would be masochism. What I'm saying is that you
don't need a ton of plugins (if any) to have a productive environment.
A few sensible options and some keybindings get the job done.

## Where this approach shines

I work on multiple machines. Not just a corporate laptop and a personal one, but
also corporate VMs, personal VMs, remote servers I need to SSH into. I work in
containerized dev environments. Sometimes it just makes sense to work from inside
a container directly.

And this is where the ultra minimal approach shines.

Whenever Neovim is available, it's just a matter of delivering this exact
configuration to that exact environment. And that's it. No additional installation
steps. No plugin managers to run. No LSP servers to download. No broken plugins
because some tool doesn't exist on that machine.

And those tools *will* be missing, because environments are different. Some fancy
setup with external dependencies? Good luck replicating that on a minimal Alpine
container or a locked-down corporate VM where you can't install anything.

With this config, I just clone or copy, hell, even rewrite it, and I'm ready to work.
Same keybindings, same behavior, everywhere. That's the real productivity gain.

## Tools over plugins

Ask yourself a real question: do you really need to do it *inside* your editor,
or could it be done with a dedicated tool? Let me give you some examples:

- Syntax check is covered by compilers or separate analyzers/language servers
- Need to manage k8s deployments? k9s is a perfect tool for this
- Most linters come as separate programs. In decent codebases, they're already
pre-configured to run during builds and commits/pushes
- File managers: tons of them
- Git: tons of tools for this (including git itself)

The thing is, dedicated tools are almost always better than editor plugins that
try to do the same thing. They're maintained by people who actually care about
that specific problem. They have their own keybindings, their own workflows,
their own ecosystems. And they don't break when you update *your editor*.

Plugins, on the other hand, are a maintenance nightmare. They depend on editor
APIs that change. They conflict with each other. They slow down startup. And
when something breaks, good luck figuring out which one it is.

What do I personally use:

- For k8s: [k9s](https://github.com/derailed/k9s)
- For git: [lazygit](https://github.com/jesseduffield/lazygit)
- For file management: [yazi](https://github.com/sxyazi/yazi)
- DB: depends, but mostly Postgres, MySQL, SQLite clients
- Linters/analyzers: whatever project requires

And the best part is that all of this can be easily managed from inside
terminal mode of Neovim. No need for plugins at all. Just open a terminal
split, run your tool, do what you need to do, and get back to editing. Simple.

## The greatest workflow enhancer

AI, obviously. Let's be real, *especially* for professional work, AI covers
most of project scaffolding and common task implementations. And in those
cases which require manual intervention and writing/rewriting code, all those
analyzers, refactoring tools, completion plugins, etc. are of no use. *Especially*
if you know what you're doing. If you're already proficient with the tech you're
using, all those bells and whistles are complementary at best, not something you
really need to rely on anymore.

Think about it. When was the last time autocomplete actually saved you significant
time? Most of the time you're either writing something so simple that typing it
is faster than waiting for suggestions, or something so specific that no amount
of static analysis will help you.

AI is progressing though, faster than editors and plugins ever did. It understands
context. It can generate boilerplate that actually makes sense for your project.
It can explain code, refactor it, write tests for it. And it does all of this
without being embedded into your editor as yet another plugin that needs updates
and configuration.

## So...

It's about simplicity.

Not simplicity for the sake of it. Not for the hype. Not to be different. Not
to cosplay as some 20th century hacker stereotype.

It's simpler than that. An editor edits text. Tools do their job. That's it.

Project scaffolding, code generation, file management, version control,
linting, databases, deployments. There are dedicated tools for all of this.
They're better at it than any plugin will ever be. So let them do it.

Just edit text, and get good at the tools you're working with.
Let everything else be what it's supposed to be.

