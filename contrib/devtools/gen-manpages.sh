#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PIVOTALCOIND=${PIVOTALCOIND:-$BINDIR/pivotalcoind}
PIVOTALCOINCLI=${PIVOTALCOINCLI:-$BINDIR/pivotalcoin-cli}
PIVOTALCOINTX=${PIVOTALCOINTX:-$BINDIR/pivotalcoin-tx}
PIVOTALCOINQT=${PIVOTALCOINQT:-$BINDIR/qt/pivotalcoin-qt}

[ ! -x $PIVOTALCOIND ] && echo "$PIVOTALCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
PVCVER=($($PIVOTALCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for pivotalcoind if --version-string is not set,
# but has different outcomes for pivotalcoin-qt and pivotalcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$PIVOTALCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $PIVOTALCOIND $PIVOTALCOINCLI $PIVOTALCOINTX $PIVOTALCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PVCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PVCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
