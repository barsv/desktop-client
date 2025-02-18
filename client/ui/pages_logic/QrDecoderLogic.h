#ifndef QR_DECODER_LOGIC_H
#define QR_DECODER_LOGIC_H

#include "PageLogicBase.h"

class UiLogic;

class QrDecoderLogic : public PageLogicBase
{
    Q_OBJECT
    AUTO_PROPERTY(bool, detectingEnabled)
    AUTO_PROPERTY(int, totalChunksCount)
    AUTO_PROPERTY(int, receivedChunksCount)

public:
    Q_INVOKABLE void onUpdatePage() override;
    Q_INVOKABLE void onDetectedQrCode(const QString &code);

public:
    explicit QrDecoderLogic(UiLogic *uiLogic, QObject *parent = nullptr);
    ~QrDecoderLogic() = default;

signals:
    void startDecode();
    void stopDecode();

private:
    QMap<int, QByteArray> m_chunks;
};
#endif // QR_DECODER_LOGIC_H
