//
//  LoggerManager.swift
//
//  Created by Irlan Abushakhmanov
//

import XCGLogger

public enum LoggerManager {
    static let log = XCGLogger.default

    public func loggerSetup() {
        LoggerManager.log.setup(
            level: .debug,
            showThreadName: true,
            showLevel: true,
            showFileNames: true,
            showLineNumbers: true,
            fileLevel: .debug
        )
    }
}
