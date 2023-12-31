#include "response.h"

const QStringList Response::retrieveErrorMessages(const QJsonArray& array) const
{
    QStringList messages; messages.reserve(array.size());
    std::for_each(array.begin(), array.end(), [&messages](const QJsonValue& value) {
        messages.emplaceBack(value.toObject().value("message").toString());
    });
    return messages;
}

Response::Response(QObject* parent)
    : QObject{ parent },
    user(nullptr)
{

}

void Response::parseSignUpResponse(const QJsonDocument document)
{
    if (document.isEmpty()) {
        emit Response::internetFail();
        return;
    }
    const auto hasErrors = document.object().contains("errors");
    if (hasErrors) {
        const auto messages = this->retrieveErrorMessages(document.object().value("errors").toArray());
        emit Response::signUpError(messages[0]);
        return;
    }
    const auto userObj = document.object().value("data").toObject().value("signUp").toObject();
    this->user = std::make_unique<User>(userObj);
    emit Response::signUpUserReady(*this->user.get());
}

void Response::parseSignInResponse(const QJsonDocument document)
{
    if (document.isEmpty()) {
        emit Response::internetFail();
        return;
    }
    const auto hasErrors = document.object().contains("errors");
    if (hasErrors) {
        const auto messages = this->retrieveErrorMessages(document.object().value("errors").toArray());
        emit Response::signInError(messages[0]);
        return;
    }
    const auto userObj = document.object().value("data").toObject().value("signIn").toObject();
    this->user = std::make_unique<User>(userObj);
    emit Response::signInReady();
}

void Response::parseCoursesListResponse(const QJsonDocument document)
{
    if (document.isEmpty()) {
        emit Response::internetFail();
        return;
    }
    const auto hasErrors = document.object().contains("errors");
    if (hasErrors) {
        const auto messages = this->retrieveErrorMessages(document.object().value("errors").toArray());
        emit Response::signInError(messages[0]);
        return;
    }
    const auto userObj = document.object().value("data").toObject().value("getCourseList").toObject();
    const auto list = userObj.value("list").toArray();
    const auto cursor = userObj.value("cursor").toString();
    emit Response::coursesList(list, cursor);
}

void Response::parseCourseSyllabusResponse(const QJsonDocument document)
{
    if (document.isEmpty()) {
        emit Response::internetFail();
        return;
    }
    const auto hasErrors = document.object().contains("errors");
    if (hasErrors) {
        const auto messages = this->retrieveErrorMessages(document.object().value("errors").toArray());
        emit Response::signInError(messages[0]);
        return;
    }
    const auto courseSyllabuses = document.object().value("data").toObject().value("getCourseSyllabus").toArray();
    emit Response::courseSyllabusList(courseSyllabuses);
}

User* const Response::getUser() const
{
    return this->user.get();
}