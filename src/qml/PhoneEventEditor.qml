/*
 *   Copyright 2019 Ildar Gilmanov <gil.ildar@gmail.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 3, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public License
 *   along with this program; if not, see <https://www.gnu.org/licenses/>
 */

import QtQuick 2.7
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.6 as Kirigami
import org.thetailcompany.digitail 1.0 as Digitail

BaseCommandListEditor {
    property var phoneEvent: null;
    readonly property string phoneEventName: phoneEvent ? phoneEvent["name"] : "";
    readonly property string phoneEventDisplayName: phoneEvent ? phoneEvent["displayName"] : "";

    objectName: "phoneEventEditor";
    title: phoneEventDisplayName;
    model: AppSettings.activePhoneEvent["commands"];

    onPhoneEventNameChanged: {
        AppSettings.setActivePhoneEventName(phoneEventName);
    }

    onInsertCommand: {
        if (!phoneEvent) {
            return;
        }

        AppSettings.addPhoneEventCommand(insertAt, command);
    }

    onRemoveCommand: {
        if (!phoneEvent) {
            return;
        }

        AppSettings.removePhoneEventCommand(index);
    }

    Component.onCompleted: {
        AppSettings.setActivePhoneEventName(phoneEventName);
    }
}