/*
 * Copyright IBM Corporation 2016-2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

/// The `WebSocketService` protocol is implemented by classes that which to be WebSocket server side
/// end points. An instance of the `WebSocketService` protocol is the server side of a WebSocket connection.
/// There can be many WebSocket connections connected to a single `WebSocketService` protocol instance.
/// The protocol is a set of callbacks that are invokes when various events occur.
public protocol WebSocketService: class {
    var path: String { get set }

    /// Called when a WebSocket client connects to the server and is connected to a specific
    /// `WebSocketService`.
    ///
    /// - Parameter connection: The `WebSocketConnection` object that represents the client's
    ///                    connection to this `WebSocketService`
    func connected(connection: WebSocketConnection)
    
    /// Called when a WebSocket client disconnects from the server.
    ///
    /// - Parameter connection: The `WebSocketConnection` object that represents the connection that
    ///                    was disconnected from this `WebSocketService`.
    /// - Paramater reason: The `WebSocketCloseReasonCode` that describes why the client disconnected.
    func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode)
    
    /// Called when a WebSocket client sent a binary message to the server to this `WebSocketService`.
    ///
    /// - Parameter message: A Data struct containing the bytes of the binary message sent by the client.
    /// - Parameter client: The `WebSocketConnection` object that represents the connection over which
    ///                    the client sent the message to this `WebSocketService`
    func received(message: Data, from: WebSocketConnection)
    
    /// Called when a WebSocket client sent a text message to the server to this `WebSocketService`.
    ///
    /// - Parameter message: A String containing the text message sent by the client.
    /// - Parameter client: The `WebSocketConnection` object that represents the connection over which
    ///                    the client sent the message to this `WebSocketService`
    func received(message: String, from: WebSocketConnection)
}
