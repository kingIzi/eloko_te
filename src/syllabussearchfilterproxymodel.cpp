#include "syllabussearchfilterproxymodel.h"
#include "syllabusListModel.h"
#include <QRegularExpression>

bool SyllabusSearchFilterProxyModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    if (this->m_searchText.isEmpty()) { return true; }
    const auto index = this->sourceModel()->index(sourceRow,0,sourceParent);
    const auto syllabusName = index.data(SyllabusListModel::NAME).toString();
    const auto syllabusAuthor = index.data(SyllabusListModel::AUTHOR).toString();
    QRegularExpression regex(QRegularExpression::escape(this->m_searchText), QRegularExpression::CaseInsensitiveOption);
    return regex.match(syllabusName).hasMatch() || regex.match(syllabusAuthor).hasMatch();
}

SyllabusSearchFilterProxyModel::SyllabusSearchFilterProxyModel(QSortFilterProxyModel *parent)
    : QSortFilterProxyModel{parent}
{

}

const QString SyllabusSearchFilterProxyModel::searchText() const
{
    return this->m_searchText;
}

void SyllabusSearchFilterProxyModel::setSearchText(const QString &searchText)
{
    if (this->m_searchText.compare(searchText,Qt::CaseInsensitive) != 0) {
        this->m_searchText = searchText;
        emit SyllabusSearchFilterProxyModel::searchTextChanged();
        this->invalidateFilter();
    }
}
