// ekke (Ekkehard Gentz) @ekkescorner
#ifndef APPLICATIONUI_HPP
#define APPLICATIONUI_HPP

#include <QObject>

class ApplicationUI : public QObject
{
    Q_OBJECT

public:
     ApplicationUI(QObject *parent = 0);

     Q_INVOKABLE
     QStringList swapThemePalette();

     Q_INVOKABLE
     QStringList defaultThemePalette();

     Q_INVOKABLE
     QStringList primaryPalette(const int paletteIndex);

     Q_INVOKABLE
     QStringList accentPalette(const int paletteIndex);

     Q_INVOKABLE
     QStringList defaultPrimaryPalette();

     Q_INVOKABLE
     QStringList defaultAccentPalette();

signals:

public slots:

private:
     bool mIsDarkTheme;
     int mPrimaryPalette;
     int mAccentPalette;
};

#endif // APPLICATIONUI_HPP
