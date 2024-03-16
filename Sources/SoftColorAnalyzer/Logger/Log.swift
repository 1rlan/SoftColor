//
//  Log.swift
//  
//  Created by Irlan Abushakhmanov
//

import Foundation

func LogColorInfo(_ logMessage: String, file: String) {
    let info = makeLogString(info: logMessage, file: file)
    LoggerManager.log.debug(info)
}

private func makeLogString(info: String, file: String) -> String {
    "[\(file)] \(info)"
}
