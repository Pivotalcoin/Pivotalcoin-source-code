// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PIVOTALCOIN_QT_PIVOTALCOINADDRESSVALIDATOR_H
#define PIVOTALCOIN_QT_PIVOTALCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class PivotalcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PivotalcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Pivotalcoin address widget validator, checks for a valid pivotalcoin address.
 */
class PivotalcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PivotalcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // PIVOTALCOIN_QT_PIVOTALCOINADDRESSVALIDATOR_H
