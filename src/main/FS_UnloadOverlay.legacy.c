extern int FS_LoadOverlayInfo(void *info, int target, int id);
extern int FS_StopOverlay(void *info);

int FS_UnloadOverlay(int target, int id) {
    char info[0x2c];
    if (FS_LoadOverlayInfo(info, target, id) == 0 || FS_StopOverlay(info) == 0) {
        return 0;
    }
    return 1;
}
