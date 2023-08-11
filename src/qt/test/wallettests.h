#ifndef PIVOTALCOIN_QT_TEST_WALLETTESTS_H
#define PIVOTALCOIN_QT_TEST_WALLETTESTS_H

#include <QObject>
#include <QTest>

class WalletTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void walletTests();
};

#endif // PIVOTALCOIN_QT_TEST_WALLETTESTS_H
