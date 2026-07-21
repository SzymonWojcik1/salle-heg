# HEG Room Availability Checker

This is a small Bash script I wrote to quickly check whether a classroom at HEG Geneva is available or occupied.

It fetches the public room status page and displays the result with colored output in the terminal.

## Features

- Check the status of a classroom by its room number
- Green output for available rooms
- Red output for occupied rooms
- Yellow output for unknown or unexpected responses

## Requirements

- Bash
- `curl`
- `perl`

## Usage

```bash
chmod +x salleHeg.sh
./salleHeg.sh <room_number>
```

Example:

```bash
./salleHeg.sh B327
```

Example output:

```text
Room Status: Salle libre
```

or

```text
Room Status: Salle occupée
```

## Note

I originally wrote this as a small personal utility during my studies at HEG Geneva to quickly check whether a classroom was free before going there. I decided to upload it to my GitHub as part of my collection of small Bash utilities.

The script relies on the current structure of the HEG room status webpage. If the website changes, the parser may need to be updated.
