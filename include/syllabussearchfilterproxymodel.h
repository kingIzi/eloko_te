#pragma once
#include <QObject>
#include <QSortFilterProxyModel>
#include <QModelIndex>

class SyllabusSearchFilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QString searchText READ searchText WRITE setSearchText NOTIFY searchTextChanged FINAL)
private:
    QString m_searchText;
protected:
    bool filterAcceptsRow(int sourceRow,const QModelIndex& sourceParent) const;
public:
    explicit SyllabusSearchFilterProxyModel(QSortFilterProxyModel *parent = nullptr);
    const QString searchText() const;
public slots:
    void setSearchText(const QString& searchText);
signals:
    void searchTextChanged();
};

