# Invite

## Problem

We have some customer records in a text file (customers.txt) - one customer per line, JSON lines formatted. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

## Instalation

### Ruby version

Requires at least Ruby 2.7.2.

### Dependencies

Ensure bundler is installed.

```zsh
gem install bundler
```

Install project dependencies.

```zsh
bundle install
```

## Usage

### Command line

By default it reads customers list from `customers.txt`.

```zsh
rake invitations
```

You can specify source file using `source`:

```zsh
rake invitations source="customers.txt"
```

## Solution

Using given sample in `customers.txt` and running:

```zsh
rake invitations source="customers.txt" > output.txt
```

The list of customers that meet given criteria is in `output.txt`.



