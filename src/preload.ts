import { contextBridge, ipcRenderer } from "electron";

contextBridge.exposeInMainWorld("swiftSpeak", {
  getSettings:        () => ipcRenderer.invoke("get-settings"),
  saveSettings:       (s: unknown) => ipcRenderer.invoke("save-settings", s),
  getAudioDevices:    () => ipcRenderer.invoke("get-audio-devices"),
  micProbeResult:     (r: unknown) => ipcRenderer.invoke("mic-probe-result", r),
  shouldFocusMic:     () => ipcRenderer.invoke("settings-focus-mic-flag"),
  completeOnboarding: () => ipcRenderer.invoke("onboarding-complete"),
  skipOnboarding:     () => ipcRenderer.invoke("onboarding-skip"),
  onPillState: (cb: (state: unknown) => void) => {
    const listener = (_e: Electron.IpcRendererEvent, state: unknown) => cb(state);
    ipcRenderer.on("pill:state", listener);
    return () => ipcRenderer.off("pill:state", listener);
  },
});
