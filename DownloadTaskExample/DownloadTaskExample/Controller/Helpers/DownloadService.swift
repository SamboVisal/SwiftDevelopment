//
//  DownloadService.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/27/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import Foundation

import Foundation

// Downloads song snippets, and stores in local file.
// Allows cancel, pause, resume download.
class DownloadService {
    
    // SearchViewController creates downloadsSession
    var downloadsSession: URLSession!
    var activeDownloads: [URL: Download] = [:]
    
    // MARK: - Download methods called by TrackCell delegate methods
    
    func startDownload(_ track: fileDownload) {
        
        print(track.previewURL)
        let download = Download(fileDownload: track)
        print("Your downloading file is \(track.previewURL)")
        download.isDownloading = true
        //download.task = downloadsSession.downloadTask(with: track.previewURL)
        download.task = SESSION.downloadTask(with: track.previewURL)
        download.task?.resume()
        download.isDownloading = true

        activeDownloads[download.fileDownload.previewURL] = download
    }
    
    func pauseDownload(_ track: fileDownload) {
        guard let download = activeDownloads[track.previewURL] else { return }
        if download.isDownloading {
            download.task?.cancel(byProducingResumeData: { data in
                download.resumeData = data
            })
            download.isDownloading = false
        }
    }
    
    func cancelDownload(_ track: fileDownload) {
        if let download = activeDownloads[track.previewURL] {
            download.task?.cancel()
            activeDownloads[track.previewURL] = nil
        }
    }
    
    func resumeDownload(_ track: fileDownload) {
        guard let download = activeDownloads[track.previewURL] else { return }
        if let resumeData = download.resumeData {
            download.task = downloadsSession.downloadTask(withResumeData: resumeData)
        } else {
            download.task = downloadsSession.downloadTask(with: download.fileDownload.previewURL)
        }
        download.task!.resume()
        download.isDownloading = true
    }
    
}
