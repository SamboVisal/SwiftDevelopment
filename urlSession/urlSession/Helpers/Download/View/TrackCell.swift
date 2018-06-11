//
//  TrackCell.swift
//  urlSession
//
//  Created by Pisal on 5/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//


import UIKit

protocol TrackCellDelegate {
    func pauseTapped(_ cell: TrackCell)
    func resumeTapped(_ cell: TrackCell)
    func cancelTapped(_ cell: TrackCell)
    func downloadTapped(_ cell: TrackCell)
}

class TrackCell: UITableViewCell {
    
    var delegate: TrackCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UIProgressView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resumeBtn: UIButton!
    
    @IBOutlet weak var progressText: UILabel!
    
    func configure(track: Track, downloaded: Bool, download: Download?) {
        titleLabel.text = track.name

        // Download controls are Pause/Resume, Cancel buttons, progress info
        var showDownloadControls = false
        // Non-nil Download object means a download is in progress
        if let download = download {
            showDownloadControls = true
            let title = download.isDownloading ? "Pause" : "Resume"
            pauseBtn.setTitle(title, for: .normal)
            progressText.text = download.isDownloading ? "Downloading..." : "Paused"
        }
    }
}
