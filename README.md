
# 📂 Media Organizer for Linux
A simple Linux-based solution to organize and backup media files (photos and videos), with automation using shell scripts and cron jobs.

## ✨ Features

1. ✅ Select and move:
   - All video/audio files to a specific folder
   - Images smaller than 1MB to a specific folder
   - Photos taken over 7 days ago to a specific folder

2. ✅ Backup:
   - Sync organized folder to two backup locations

3. ✅ Automation:
   - Daily sync to `folder_back01` (via crontab)
   - Weekly sync to `folder_back02` (via crontab)

4. ✅ Weekly email report:
   - File count and total size growth of `folder_origin`

## 🔧 Scripts

| Script | Description |
|--------|-------------|
| `filter_media.sh` | Filters and moves files according to rules 1–3 |
| `sync_folders.sh` | rsync from `folder_origin` to backups |
| `report_growth.sh` | Calculates file count and size |
| `email_report.sh` | Sends the weekly report via email |

## 🕒 Crontab Sample

Put the following into your crontab:

```cron
# Daily sync to back01 at 1 AM
0 1 * * * /path/to/sync_folders.sh back01

# Weekly sync to back02 at 2 AM every Sunday
0 2 * * 0 /path/to/sync_folders.sh back02

# Weekly report on Sunday at 3 AM
0 3 * * 0 /path/to/email_report.sh
