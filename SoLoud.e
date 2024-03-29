-----------------------------------
--EuSoLoud						 --
--Written by Andy P.			 --
--Icy Viking Games				 --
--Wrapper of SoLoud for Euphoria --
--Eu Ver: 4.1.0 Beta 2			 --
--SoLoud Ver: 202002			 --
--Audio Library					 --
--Copyright (c) 2023			 --
-----------------------------------

include std/machine.e
include std/ffi.e
include std/os.e

public atom sol = 0

ifdef WIN32 then
	sol = open_dll("soloud_x86.dll")
	elsifdef LINUX or FREEBSD then
	sol = open_dll("soloud_x86.so")
end ifdef

include flags.e

--SoLoud Functions

public constant xSoloud_destroy = define_c_proc(sol,"+Soloud_destroy",{C_POINTER})

public procedure Soloud_destroy(atom so)

 c_proc(xSoloud_destroy,{so})
	
end procedure

public constant xSoloud_create = define_c_func(sol,"+Soloud_create",{},C_POINTER)

public function Soloud_create()

 return c_func(xSoloud_create,{})
	
end function

public constant xSoloud_initEx = define_c_func(sol,"+Soloud_initEx",{C_POINTER,C_UINT,C_UINT,C_UINT,C_UINT,C_UINT},C_INT)

public function Soloud_init(atom aSoloud, atom aFlags=SOLOUD_CLIP_ROUNDOFF, atom aBackend=SOLOUD_AUTO, atom aSampleRate=SOLOUD_AUTO, atom aBufferSize=SOLOUD_AUTO, atom aChannels=2)

 return c_func(xSoloud_initEx,{aSoloud,aFlags,aBackend,aSampleRate,aBufferSize,aChannels})
	
end function

public constant xSoloud_deinit = define_c_proc(sol,"+Soloud_deinit",{C_POINTER})

public procedure Soloud_deinit(atom so)

 c_proc(xSoloud_deinit,{so})
	
end procedure

public constant xSoloud_getVersion = define_c_func(sol,"+Soloud_getVersion",{C_POINTER},C_UINT)

public function Soloud_getVersion(atom so)

 return c_func(xSoloud_getVersion,{so})
	
end function

public constant xSoloud_getErrorString = define_c_func(sol,"+Soloud_getErrorString",{C_POINTER,C_INT},C_POINTER)

public function Soloud_getErrorString(atom so,atom code)

 return c_func(xSoloud_getErrorString,{so,code})
	
end function

public constant xSoloud_getBackendId = define_c_func(sol,"+Soloud_getBackendId",{C_POINTER},C_UINT)

public function Soloud_getBackendId(atom so)

 return c_func(xSoloud_getBackendId,{so})
	
end function

public constant xSoloud_getBackendString = define_c_func(sol,"+Soloud_getBackendString",{C_POINTER},C_POINTER)

public function Soloud_getBackendString(atom so)

 return c_func(xSoloud_getBackendString,{so})
	
end function

public constant xSoloud_getBackendChannels = define_c_func(sol,"+Soloud_getBackendChannels",{C_POINTER},C_UINT)

public function Soloud_getBackendChannels(atom so)

 return c_func(xSoloud_getBackendChannels,{so})
	
end function

public constant xSoloud_getBackendSamplerate = define_c_func(sol,"+Soloud_getBackendSamplerate",{C_POINTER},C_UINT)

public function Soloud_getBackendSamplerate(atom so)

 return c_func(xSoloud_getBackendSamplerate,{so})
	
end function

public constant xSoloud_getBackendBufferSize = define_c_func(sol,"+Soloud_getBackendBufferSize",{C_POINTER},C_UINT)

public function Soloud_getBackendBufferSize(atom so)

 return c_func(xSoloud_getBackendBufferSize,{so})
	
end function

public constant xSoloud_setSpeakerPosition = define_c_func(sol,"+Soloud_setSpeakerPosition",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT},C_INT)

public function Soloud_setSpeakerPosition(atom so,atom channel,atom x,atom y,atom z)

 return c_func(xSoloud_setSpeakerPosition,{so,channel,x,y,z})
	
end function

public constant xSoloud_getSpeakerPosition = define_c_func(sol,"+Soloud_getSpeakerPosition",{C_POINTER,C_UINT,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function Soloud_getSpeakerPosition(atom so,atom channel,atom x,atom y,atom z)

 return c_func(xSoloud_getSpeakerPosition,{so,channel,x,y,z})
	
end function

public constant xSoloud_play = define_c_func(sol,"+Soloud_play",{C_POINTER,C_POINTER},C_UINT)

public function Soloud_play(atom so,atom so2)

 return c_func(xSoloud_play,{so,so2})
	
end function

public constant xSoloud_playEx = define_c_func(sol,"+Soloud_playEx",{C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_INT,C_UINT},C_UINT)

public function Soloud_playEx(atom so,atom so2,atom vol,atom pan,atom paused,atom bus)

 return c_func(xSoloud_playEx,{so,so2,vol,pan,paused,bus})
	
end function

public constant xSoloud_playClocked = define_c_func(sol,"+Soloud_playClocked",{C_POINTER,C_DOUBLE,C_POINTER},C_UINT)

public function Soloud_playClocked(atom so,atom xtime,atom so2)

 return c_func(xSoloud_playClocked,{so,xtime,so2})
	
end function

public constant xSoloud_playClockedEx = define_c_func(sol,"+Soloud_playClockedEx",{C_POINTER,C_DOUBLE,C_POINTER,C_FLOAT,C_FLOAT,C_UINT},C_UINT)

public function Soloud_playClockedEx(atom so,atom xtime,atom so2,atom vol,atom pan,atom bus)

 return c_func(xSoloud_playClockedEx,{so,xtime,so2,vol,pan,bus})
	
end function

public constant xSoloud_play3d = define_c_func(sol,"+Soloud_play3d",{C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT},C_UINT)

public function Soloud_play3d(atom so,atom so2,atom x,atom y,atom z)

 return c_func(xSoloud_play3d,{so,so2,x,y,z})
	
end function

public constant xSoloud_play3dEx = define_c_func(sol,"+Soloud_play3dEx",{C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_UINT},C_UINT)

public function Soloud_play3dEx(atom so,atom so2,atom x,atom y,atom z,atom vx,atom vy,atom vz,atom vol,atom paused,atom bus)

 return c_func(xSoloud_play3dEx,{so,so2,x,y,z,vx,vy,vz,vol,paused,bus})
	
end function

public constant xSoloud_3dClocked = define_c_func(sol,"+Soloud_3dClocked",{C_POINTER,C_DOUBLE,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT},C_UINT)

public function Soloud_3dClocked(atom so,atom xtime,atom so2,atom x,atom y,atom z)

 return c_func(xSoloud_3dClocked,{so,xtime,so2,x,y,z})
	
end function

public constant xSoloud_3dClockedEx = define_c_func(sol,"+Soloud_3dClockedEx",{C_POINTER,C_DOUBLE,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_UINT},C_UINT)

public function Soloud_3dClockedEx(atom so,atom xtime,atom so2,atom x,atom y,atom z,atom vx,atom vy,atom vz,atom vol,atom bus)

 return c_func(xSoloud_3dClockedEx,{so,xtime,so2,x,y,z,vx,vy,vz,vol,bus})
	
end function

public constant xSoloud_playBackground = define_c_func(sol,"+Soloud_playBackground",{C_POINTER,C_POINTER},C_UINT)

public function Soloud_playBackground(atom so,atom so2)

 return c_func(xSoloud_playBackground,{so,so2})
	
end function

public constant xSoloud_playBackgroundEx = define_c_func(sol,"+Soloud_playBackgroundEx",{C_POINTER,C_POINTER,C_FLOAT,C_INT,C_UINT},C_UINT)

public function Soloud_playBackgroundEx(atom so,atom so2,atom vol,atom paused,atom bus)

 return c_func(xSoloud_playBackgroundEx,{so,so2,vol,paused,bus})
	
end function

public constant xSoloud_seek = define_c_func(sol,"+Soloud_seek",{C_POINTER,C_UINT,C_DOUBLE},C_INT)

public function Soloud_seek(atom so,atom hand,atom secs)

 return c_func(xSoloud_seek,{so,hand,secs})
	
end function

public constant xSoloud_stop = define_c_proc(sol,"+Soloud_stop",{C_POINTER,C_UINT})

public procedure Soloud_stop(atom so,atom hand)

 c_proc(xSoloud_stop,{so,hand})
	
end procedure

public constant xSoloud_stopAll = define_c_proc(sol,"+Soloud_stopAll",{C_POINTER})

public procedure Soloud_stopAll(atom so)

 c_proc(xSoloud_stopAll,{so})
	
end procedure

public constant xSoloud_stopAudioSource = define_c_proc(sol,"+Soloud_stopAudioSource",{C_POINTER,C_POINTER})

public procedure Soloud_stopAudioSource(atom so,atom so2)

 c_proc(xSoloud_stopAudioSource,{so,so2})
	
end procedure

public constant xSoloud_countAudioSource = define_c_func(sol,"+Soloud_countAudioSource",{C_POINTER,C_POINTER},C_INT)

public function Soloud_countAudioSource(atom so,atom so2)

 return c_func(xSoloud_countAudioSource,{so,so2})
	
end function

public constant xSoloud_setFilterParameter = define_c_proc(sol,"+Soloud_setFilterParameter",{C_POINTER,C_UINT,C_UINT,C_UINT,C_FLOAT})

public procedure Soloud_setFilterParameter(atom so,atom hand,atom id,atom id2,atom val)

 c_proc(xSoloud_setFilterParameter,{so,hand,id,id2,val})
	
end procedure

public constant xSoloud_getFilterParameter = define_c_func(sol,"+Soloud_getFilterParameter",{C_POINTER,C_UINT,C_UINT,C_UINT},C_FLOAT)

public function Soloud_getFilterParameter(atom so,atom hand,atom id,atom id2)

 return c_func(xSoloud_getFilterParameter,{so,hand,id,id2})
	
end function

public constant xSoloud_fadeFilterParameter = define_c_proc(sol,"+Soloud_fadeFilterParameter",{C_POINTER,C_UINT,C_UINT,C_UINT,C_FLOAT,C_FLOAT})

public procedure Soloud_fadeFilterParameter(atom so,atom hand,atom id,atom id2,atom xto,atom xtime)

 c_proc(xSoloud_fadeFilterParameter,{so,hand,id,id2,xto,xtime})
	
end procedure

public constant xSoloud_oscillateFilterParameter = define_c_proc(sol,"+Soloud_oscillateFilterParameter",{C_POINTER,C_UINT,C_UINT,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_oscillateFilterParameter(atom so,atom hand,atom id,atom id2,atom afrom,atom ato,atom atime)

 c_proc(xSoloud_oscillateFilterParameter,{so,hand,id,id2,afrom,ato,atime})
	
end procedure

public constant xSoloud_getStreamTime = define_c_func(sol,"+Soloud_getStreamTime",{C_POINTER,C_UINT},C_DOUBLE)

public function Soloud_getStreamTime(atom so,atom hand)

 return c_func(xSoloud_getStreamTime,{so,hand})
	
end function

public constant xSoloud_getStreamPosition = define_c_func(sol,"+Soloud_getStreamPosition",{C_POINTER,C_UINT},C_DOUBLE)

public function Soloud_getStreamPosition(atom so,atom hand)

 return c_func(xSoloud_getStreamPosition,{so,hand})
	
end function

public constant xSoloud_getPause = define_c_func(sol,"+Soloud_getPause",{C_POINTER,C_UINT},C_INT)

public function Soloud_getPause(atom so,atom hand)

 return c_func(xSoloud_getPause,{so,hand})
	
end function

public constant xSoloud_getVolume = define_c_func(sol,"+Soloud_getVolume",{C_POINTER,C_UINT},C_FLOAT)

public function Soloud_getVolume(atom so,atom hand)

 return c_func(xSoloud_getVolume,{so,hand})
	
end function

public constant xSoloud_getOverallVolume = define_c_func(sol,"+Soloud_getOverallVolume",{C_POINTER,C_UINT},C_FLOAT)

public function Soloud_getOverallVolume(atom so,atom hand)

 return c_func(xSoloud_getOverallVolume,{so,hand})
	
end function

public constant xSoloud_getPan = define_c_func(sol,"+Soloud_getPan",{C_POINTER,C_UINT},C_FLOAT)

public function Soloud_getPan(atom so,atom hand)

 return c_func(xSoloud_getPan,{so,hand})
	
end function

public constant xSoloud_getSamplerate = define_c_func(sol,"+Soloud_getSamplerate",{C_POINTER,C_UINT},C_FLOAT)

public function Soloud_getSamplerate(atom so,atom hand)

 return c_func(xSoloud_getSamplerate,{so,hand})
	
end function

public constant xSoloud_getProtectVoice = define_c_func(sol,"+Soloud_getProtectVoice",{C_POINTER,C_UINT},C_INT)

public function Soloud_getProtectVoice(atom so,atom hand)

 return c_func(xSoloud_getProtectVoice,{so,hand})
	
end function

public constant xSoloud_getActiveVoiceCount = define_c_func(sol,"+Soloud_getActiveVoiceCount",{C_POINTER},C_UINT)

public function Soloud_getActiveVoiceCount(atom so)

 return c_func(xSoloud_getActiveVoiceCount,{so})
	
end function

public constant xSoloud_getVoiceCount = define_c_func(sol,"+Soloud_getVoiceCount",{C_POINTER},C_UINT)

public function Soloud_getVoiceCount(atom so)

 return c_func(xSoloud_getVoiceCount,{so})
	
end function

public constant xSoloud_isValidVoiceHandle = define_c_func(sol,"+Soloud_isValidVoiceHandle",{C_POINTER,C_UINT},C_INT)

public function Soloud_isValidVoiceHandle(atom so,atom hand)

 return c_func(xSoloud_isValidVoiceHandle,{so,hand})
	
end function

public constant xSoloud_getRelativePlaySpeed = define_c_func(sol,"+Soloud_getRelativePlaySpeed",{C_POINTER,C_UINT},C_FLOAT)

public function Soloud_getRelativePlaySpeed(atom so,atom hand)

 return c_func(xSoloud_getRelativePlaySpeed,{so,hand})
	
end function

public constant xSoloud_getPostClipScaler = define_c_func(sol,"+Soloud_getPostClipScaler",{C_POINTER},C_FLOAT)

public function Soloud_getPostClipScaler(atom so)

 return c_func(xSoloud_getPostClipScaler,{so})
	
end function

public constant xSoloud_getGlobalVolume = define_c_func(sol,"+Soloud_getGlobalVolume",{C_POINTER},C_FLOAT)

public function Soloud_getGlobalVolume(atom so)

 return c_func(xSoloud_getGlobalVolume,{so})
	
end function

public constant xSoloud_getMaxActiveVoiceCount = define_c_func(sol,"+Soloud_getMaxActiveVoiceCount",{C_POINTER},C_UINT)

public function Soloud_getMaxActiveVoiceCount(atom so)

 return c_func(xSoloud_getMaxActiveVoiceCount,{so})
	
end function

public constant xSoloud_getLooping = define_c_func(sol,"+Soloud_getLooping",{C_POINTER,C_UINT},C_INT)

public function Soloud_getLooping(atom so,atom hand)

 return c_func(xSoloud_getLooping,{so,hand})
	
end function

public constant xSoloud_getLoopPoint = define_c_func(sol,"+Soloud_getLoopPoint",{C_POINTER,C_UINT},C_DOUBLE)

public function Soloud_getLoopPoint(atom so,atom hand)

 return c_func(xSoloud_getLoopPoint,{so,hand})
	
end function

public constant xSoloud_setLoopPoint = define_c_proc(sol,"+Soloud_setLoopPoint",{C_POINTER,C_UINT,C_DOUBLE})

public procedure Soloud_setLoopPoint(atom so,atom hand,atom pt)

 c_proc(xSoloud_setLoopPoint,{so,hand,pt})
	
end procedure

public constant xSoloud_setLooping = define_c_proc(sol,"+Soloud_setLooping",{C_POINTER,C_UINT,C_INT})

public procedure Soloud_setLooping(atom so,atom hand,atom xloop)

 c_proc(xSoloud_setLooping,{so,hand,xloop})
	
end procedure

public constant xSoloud_setMaxActiveVoiceCount = define_c_func(sol,"+Soloud_setMaxActiveVoiceCount",{C_POINTER,C_UINT},C_INT)

public function Soloud_setMaxActiveVoiceCount(atom so,atom cnt)

 return c_func(xSoloud_setMaxActiveVoiceCount,{so,cnt})
	
end function

public constant xSoloud_setInaudibleBehavior = define_c_proc(sol,"+Soloud_setInaudibleBehavior",{C_POINTER,C_UINT,C_INT,C_INT})

public procedure Soloud_setInaudibleBehavior(atom so,atom hand,atom tick,atom ki)

 c_proc(xSoloud_setInaudibleBehavior,{so,hand,tick,ki})
	
end procedure

public constant xSoloud_setGlobalVolume = define_c_proc(sol,"+Soloud_setGlobalVolume",{C_POINTER,C_FLOAT})

public procedure Soloud_setGlobalVolume(atom so,atom vol)

 c_proc(xSoloud_setGlobalVolume,{so,vol})
	
end procedure

public constant xSoloud_setPostClipScaler = define_c_proc(sol,"+Soloud_setPostClipScaler",{C_POINTER,C_FLOAT})

public procedure Soloud_setPostClipScaler(atom so,atom sca)

 c_proc(xSoloud_setPostClipScaler,{so,sca})
	
end procedure

public constant xSoloud_setPause = define_c_proc(sol,"+Soloud_setPause",{C_POINTER,C_UINT,C_INT})

public procedure Soloud_setPause(atom so,atom hand,atom pau)

 c_proc(xSoloud_setPause,{so,hand,pau})
	
end procedure

public constant xSoloud_setPauseAll = define_c_proc(sol,"+Soloud_setPauseAll",{C_POINTER,C_INT})

public procedure Soloud_setPauseAll(atom so,atom pau)

 c_proc(xSoloud_setPauseAll,{so,pau})
	
end procedure

public constant xSoloud_setRelativePlaySpeed = define_c_func(sol,"+Soloud_setRelativePlaySpeed",{C_POINTER,C_UINT,C_FLOAT},C_INT)

public function Soloud_setRelativePlaySpeed(atom so,atom hand,atom spd)

 return c_func(xSoloud_setRelativePlaySpeed,{so,hand,spd})
	
end function

public constant xSoloud_setProtectVoice = define_c_proc(sol,"+Soloud_setProtectVoice",{C_POINTER,C_UINT,C_INT})

public procedure Soloud_setProtectVoice(atom so,atom hand,atom pro)

 c_proc(xSoloud_setProtectVoice,{so,hand,pro})
	
end procedure

public constant xSoloud_setSamplerate = define_c_proc(sol,"+Soloud_setSamplerate",{C_POINTER,C_UINT,C_FLOAT})

public procedure Soloud_setSamplerate(atom so,atom hand,atom rate)

 c_proc(xSoloud_setSamplerate,{so,hand,rate})
	
end procedure

public constant xSoloud_setPan = define_c_proc(sol,"+Soloud_setPan",{C_POINTER,C_UINT,C_FLOAT})

public procedure Soloud_setPan(atom so,atom hand,atom pan)

 c_proc(xSoloud_setPan,{so,hand,pan})
	
end procedure

public constant xSoloud_setPanAbsolute = define_c_proc(sol,"+Soloud_setPanAbsolute",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT})

public procedure Soloud_setPanAbsolute(atom so,atom hand,atom lVol,atom rVol)

 c_proc(xSoloud_setPanAbsolute,{so,hand,lVol,rVol})
	
end procedure

public constant xSoloud_setPanAbsoluteEx = define_c_proc(sol,"+Soloud_setPanAbsoluteEx",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_setPanAbsoluteEx(atom so,atom hand,atom LVol,atom RVol,atom LBVol,atom RBVol,atom CVol,atom SVol)

 c_proc(xSoloud_setPanAbsoluteEx,{so,hand,LVol,RVol,LBVol,RBVol,CVol,SVol})
	
end procedure

public constant xSoloud_setVolume = define_c_proc(sol,"+Soloud_setVolume",{C_POINTER,C_UINT,C_FLOAT})

public procedure Soloud_setVolume(atom so,atom hand,atom vol)

 c_proc(xSoloud_setVolume,{so,hand,vol})
	
end procedure

public constant xSoloud_setDelaySamples = define_c_proc(sol,"+Soloud_setDelaySamples",{C_POINTER,C_UINT,C_UINT})

public procedure Soloud_setDelaySamples(atom so,atom hand,atom samp)

 c_proc(xSoloud_setDelaySamples,{so,hand,samp})
	
end procedure

public constant xSoloud_fadeVolume = define_c_proc(sol,"+Soloud_fadeVolume",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT})

public procedure Soloud_fadeVolume(atom so,atom hand,atom xto,atom xtime)

 c_proc(xSoloud_fadeVolume,{so,hand,xto,xtime})
	
end procedure

public constant xSoloud_fadePan = define_c_proc(sol,"+Soloud_fadePan",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT})

public procedure Soloud_fadePan(atom so,atom hand,atom xto,atom xtime)

 c_proc(xSoloud_fadePan,{so,hand,xto,xtime})
	
end procedure

public constant xSoloud_fadeRelativePlaySpeed = define_c_proc(sol,"+Soloud_fadeRelativePlaySpeed",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT})

public procedure Soloud_fadeRelativePlaySpeed(atom so,atom hand,atom xto,atom xtime)

 c_proc(xSoloud_fadeRelativePlaySpeed,{so,hand,xto,xtime})
	
end procedure

public constant xSoloud_fadeGlobalVolume = define_c_proc(sol,"+Soloud_fadeGlobalVolume",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Soloud_fadeGlobalVolume(atom so,atom xto,atom xtime)

 c_proc(xSoloud_fadeGlobalVolume,{so,xto,xtime})
	
end procedure

public constant xSoloud_schedulePause = define_c_proc(sol,"+Soloud_schedulePause",{C_POINTER,C_UINT,C_DOUBLE})

public procedure Soloud_schedulePause(atom so,atom hand,atom xtime)

 c_proc(xSoloud_schedulePause,{so,hand,xtime})
	
end procedure

public constant xSoloud_scheduleStop = define_c_proc(sol,"+Soloud_scheduleStop",{C_POINTER,C_UINT,C_DOUBLE})

public procedure Soloud_scheduleStop(atom so,atom hand,atom xtime)

 c_proc(xSoloud_scheduleStop,{so,hand,xtime})
	
end procedure

public constant xSoloud_oscillateVolume = define_c_proc(sol,"+Soloud_oscillateVolume",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_oscillateVolume(atom so,atom hand,atom xfro,atom xto,atom xtime)

 c_proc(xSoloud_oscillateVolume,{so,hand,xfro,xto,xtime})
	
end procedure

public constant xSoloud_oscillatePan = define_c_proc(sol,"+Soloud_osciilatePan",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_oscillatePan(atom so,atom hand,atom xfro,atom xto,atom xtime)

 c_proc(xSoloud_oscillatePan,{so,hand,xfro,xto,xtime})
	
end procedure

public constant xSoloud_oscillateRelativePlaySpeed = define_c_proc(sol,"+Soloud_oscillateRelativePlaySpeed",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_oscillateRelativePlaySpeed(atom so,atom hand,atom xfro,atom xto,atom xtime)

 c_proc(xSoloud_oscillateRelativePlaySpeed,{so,hand,xfro,xto,xtime})
	
end procedure

public constant xSoloud_oscillateGlobalVolume = define_c_proc(sol,"+Soloud_oscillateGlobalVolume",{C_POINTER,C_FLOAT,C_FLOAT,C_DOUBLE})

public procedure Soloud_oscillateGlobalVolume(atom so,atom xfro,atom xto,atom xtime)

 c_proc(xSoloud_oscillateGlobalVolume,{so,xfro,xto,xtime})
	
end procedure

public constant xSoloud_setGlobalFilter = define_c_proc(sol,"+Soloud_setGlobalFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Soloud_setGlobalFilter(atom so,atom id,atom filt)

 c_proc(xSoloud_setGlobalFilter,{so,id,filt})
	
end procedure

public constant xSoloud_setVisualizationEnable = define_c_proc(sol,"+Soloud_setVisualizationEnable",{C_POINTER,C_INT})

public procedure Soloud_setVisualizationEnable(atom so,atom en)

 c_proc(xSoloud_setVisualizationEnable,{so,en})
	
end procedure

public constant xSoloud_calcFFT = define_c_func(sol,"+Soloud_calcFFT",{C_POINTER},C_POINTER)

public function Soloud_calcFFT(atom so)

 return c_func(xSoloud_calcFFT,{so})
	
end function

public constant xSoloud_getWave = define_c_func(sol,"+Soloud_getWave",{C_POINTER},C_POINTER)

public function Soloud_getWave(atom so)

 return c_func(xSoloud_getWave,{so})
	
end function

public constant xSoloud_getApproximateVolume = define_c_func(sol,"+Soloud_getApproximateVolume",{C_POINTER,C_UINT},C_FLOAT)

public function Soloud_getApproximateVolume(atom so,atom chan)

 return c_func(xSoloud_getApproximateVolume,{so,chan})
	
end function

public constant xSoloud_getLoopCount = define_c_func(sol,"+Soloud_getLoopCount",{C_POINTER,C_UINT},C_UINT)

public function Soloud_getLoopCount(atom so,atom hand)

 return c_func(xSoloud_getLoopCount,{so,hand})
	
end function

public constant xSoloud_getInfo = define_c_func(sol,"+Soloud_getInfo",{C_POINTER,C_UINT,C_UINT},C_FLOAT)

public function Soloud_getInfo(atom so,atom hand,atom info)

 return c_func(xSoloud_getInfo,{so,hand,info})
	
end function

public constant xSoloud_createVoiceGroup = define_c_func(sol,"+Soloud_createVoiceGroup",{C_POINTER},C_UINT)

public function Soloud_createVoiceGroup(atom so)

 return c_func(xSoloud_createVoiceGroup,{so})
	
end function

public constant xSoloud_destroyVoiceGroup = define_c_func(sol,"+Soloud_destroyVoiceGroup",{C_POINTER,C_UINT},C_INT)

public function Soloud_destroyVoiceGroup(atom so,atom hand)

 return c_func(xSoloud_destroyVoiceGroup,{so,hand})
	
end function

public constant xSoloud_addVoiceToGroup = define_c_func(sol,"+Soloud_addVoiceToGroup",{C_POINTER,C_UINT,C_UINT},C_INT)

public function Soloud_addVoiceToGroup(atom so,atom hand,atom hand2)

 return c_func(xSoloud_addVoiceToGroup,{so,hand,hand2})
	
end function

public constant xSoloud_isVoiceGroup = define_c_func(sol,"+Soloud_isVoiceGroup",{C_POINTER,C_UINT},C_INT)

public function Soloud_isVoiceGroup(atom so,atom hand)

 return c_func(xSoloud_isVoiceGroup,{so,hand})
	
end function

public constant xSoloud_isVoiceGroupEmpty = define_c_func(sol,"+Soloud_isVoiceGroupEmpty",{C_POINTER,C_UINT},C_INT)

public function Soloud_isVoiceGroupEmpty(atom so,atom hand)

 return c_func(xSoloud_isVoiceGroupEmpty,{so,hand})
	
end function

public constant xSoloud_update3dAudio = define_c_proc(sol,"+Soloud_update3dAudio",{C_POINTER})

public procedure Soloud_update3dAudio(atom so)

 c_proc(xSoloud_update3dAudio,{so})
	
end procedure

public constant xSoloud_set3dSoundSpeed = define_c_func(sol,"+Soloud_set3dSoundSpeed",{C_POINTER,C_FLOAT},C_INT)

public function Soloud_set3dSoundSpeed(atom so,atom spd)

 return c_func(xSoloud_set3dSoundSpeed,{so,spd})
	
end function

public constant xSoloud_get3dSoundSpeed = define_c_func(sol,"+Soloud_get3dSoundSpeed",{C_POINTER},C_FLOAT)

public function Soloud_get3dSoundSpeed(atom so)

 return c_func(xSoloud_get3dSoundSpeed,{so})
	
end function

public constant xSoloud_set3dListenerParameters = define_c_proc(sol,"+Soloud_set3dListenerParameters",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dListenerParameters(atom so,atom px,atom py,atom pz,atom ax,atom ay,atom az,atom ux,atom uy,atom uz)

 c_proc(xSoloud_set3dListenerParameters,{so,px,py,pz,ax,ay,az,ux,uy,uz})
	
end procedure

public constant xSoloud_set3dListenerParametersEx = define_c_proc(sol,"+Soloud_set3dListenerParametersEx",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dListenerParametersEx(atom so,atom px,atom py,atom pz,atom ax,atom ay,atom az,atom ux,atom uy,atom uz,atom vx,atom vy,atom vz)

 c_proc(xSoloud_set3dListenerParametersEx,{so,px,py,pz,ax,ay,az,ux,uy,uz,vx,vy,vz})
	
end procedure

public constant xSoloud_set3dListenerPosition = define_c_proc(sol,"+Soloud_set3dListenerPosition",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dListenerPosition(atom so,atom x,atom y,atom z)

 c_proc(xSoloud_set3dListenerPosition,{so,x,y,z})
	
end procedure

public constant xSoloud_set3dListenerAt = define_c_proc(sol,"+Soloud_set3dListenerAt",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dListenerAt(atom so,atom x,atom y,atom z)

 c_proc(xSoloud_set3dListenerAt,{so,x,y,z})
	
end procedure

public constant xSoloud_set3dListenerUp = define_c_proc(sol,"+Soloud_set3dListenerUp",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dListenerUp(atom so,atom x,atom y,atom z)

 c_proc(xSoloud_set3dListenerUp,{so,x,y,z})
	
end procedure

public constant xSoloud_set3dListenerVelocity = define_c_proc(sol,"+Soloud_set3dListenerVelocity",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dListenerVelocity(atom so,atom x,atom y,atom z)

 c_proc(xSoloud_set3dListenerVelocity,{so,x,y,z})
	
end procedure

public constant xSoloud_set3dSourceParameters = define_c_proc(sol,"+Soloud_set3dSourceParameters",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dSourceParameters(atom so,atom hand,atom x,atom y,atom z)

 c_proc(xSoloud_set3dSourceParameters,{so,hand,x,y,z})
	
end procedure

public constant xSoloud_set3dSourceParametersEx = define_c_proc(sol,"+Soloud_set3dSourceParametersEx",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dSourceParametersEx(atom so,atom hand,atom x,atom y,atom z,atom vx,atom vy,atom vz)

 c_proc(xSoloud_set3dSourceParametersEx,{so,hand,x,y,z,vx,vy,vz})
	
end procedure

public constant xSoloud_set3dSourcePosition = define_c_proc(sol,"+Soloud_set3dSourcePosition",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dSourcePosition(atom so,atom hand,atom x,atom y,atom z)

 c_proc(xSoloud_set3dSourcePosition,{so,hand,x,y,z})
	
end procedure

public constant xSoloud_set3dSourceVelocity = define_c_proc(sol,"+Soloud_set3dSourceVelocity",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dSourceVelocity(atom so,atom hand,atom x,atom y,atom z)

 c_proc(xSoloud_set3dSourceVelocity,{so,hand,x,y,z})
	
end procedure

public constant xSoloud_set3dSourceMinMaxDistance = define_c_proc(sol,"+Soloud_set3dSourceMinMaxDistance",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT})

public procedure Soloud_set3dSourceMinMaxDistance(atom so,atom hand,atom min,atom max)

 c_proc(xSoloud_set3dSourceMinMaxDistance,{so,hand,min,max})
	
end procedure

public constant xSoloud_set3dSourceAttenuation = define_c_proc(sol,"+Soloud_set3dSourceAttenuation",{C_POINTER,C_UINT,C_UINT,C_FLOAT})

public procedure Soloud_set3dSourceAttenuation(atom so,atom hand,atom att,atom fact)

 c_proc(xSoloud_set3dSourceAttenuation,{so,hand,att,fact})
	
end procedure

public constant xSoloud_set3dSourceDopplerFactor = define_c_proc(sol,"+Soloud_set3dSourceDopplerFactor",{C_POINTER,C_UINT,C_FLOAT})

public procedure Soloud_set3dSourceDopplerFactor(atom so,atom hand,atom dop)

 c_proc(xSoloud_set3dSourceDopplerFactor,{so,hand,dop})
	
end procedure

public constant xSoloud_mix = define_c_proc(sol,"+Soloud_mix",{C_POINTER,C_POINTER,C_UINT})

public procedure Soloud_mix(atom so,atom buf,atom samp)

 c_proc(xSoloud_mix,{so,buf,samp})
	
end procedure

public constant xSoloud_mixSigned16 = define_c_proc(sol,"+Soloud_mixSigned16",{C_POINTER,C_POINTER,C_UINT})

public procedure Soloud_mixSigned16(atom so,atom buf,atom samp)

 c_proc(xSoloud_mixSigned16,{so,buf,samp})
	
end procedure

--BassboostFilter Functions

public constant xBassboostFilter_destroy = define_c_proc(sol,"+BassboostFilter_destroy",{C_POINTER})

public procedure BassboostFilter_destroy(atom bass)

 c_proc(xBassboostFilter_destroy,{bass})
	
end procedure

public constant xBassboostFilter_getParamCount = define_c_func(sol,"+BassboostFilter_getParamCount",{C_POINTER},C_INT)

public function BassboostFilter_getParamCount(atom bass)

 return c_func(xBassboostFilter_getParamCount,{bass})
	
end function

public constant xBassboostFilter_getParamName = define_c_func(sol,"+BassboostFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function BassboostFilter_getParamName(atom bass,atom par)

 return c_func(xBassboostFilter_getParamName,{bass,par})
	
end function

public constant xBassboostFilter_getParamType = define_c_func(sol,"+BassboostFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function BassboostFilter_getParamType(atom bass,atom par)

 return c_func(xBassboostFilter_getParamType,{bass,par})
	
end function

public constant xBassboostFilter_getParamMax = define_c_func(sol,"+BassboostFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function BassboostFilter_getParamMax(atom bass,atom par)

 return c_func(xBassboostFilter_getParamMax,{bass,par})
	
end function

public constant xBassboostFilter_getParamMin = define_c_func(sol,"+BassboostFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function BassboostFilter_getParamMin(atom bass,atom par)

 return c_func(xBassboostFilter_getParamMin,{bass,par})
	
end function

public constant xBassboostFilter_setParams = define_c_func(sol,"+BassboostFilter_setParams",{C_POINTER,C_FLOAT},C_INT)

public function BassboostFilter_setParams(atom bass,atom boost)

 return c_func(xBassboostFilter_setParams,{bass,boost})
	
end function

public constant xBassboostFilter_create = define_c_func(sol,"+BassboostFilter_create",{},C_POINTER)

public function BassboostFilter_create()

 return c_func(xBassboostFilter_create,{})
	
end function

--BiquadResonantFilter Functions

public constant xBiquadResonantFilter_destroy = define_c_proc(sol,"+BiquadResonantFilter_destroy",{C_POINTER})

public procedure BiquadResonantFilter_destroy(atom bi)

 c_proc(xBiquadResonantFilter_destroy,{bi})
	
end procedure

public constant xBiquadResonantFilter_getParamCount = define_c_func(sol,"+BiquadResonantFilter_getParamCount",{C_POINTER},C_INT)

public function BiquadResonantFilter_getParamCount(atom bi)

 return c_func(xBiquadResonantFilter_getParamCount,{bi})
	
end function

public constant xBiquadResonantFilter_getParamName = define_c_func(sol,"+BiquadResonantFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function BiquadResonantFilter_getParamName(atom bi,atom parm)

 return c_func(xBiquadResonantFilter_getParamName,{bi,parm})
	
end function

public constant xBiquadResonantFilter_getParamType = define_c_func(sol,"+BiquadResonantFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function BiquadResonantFilter_getParamType(atom bi,atom parm)

 return c_func(xBiquadResonantFilter_getParamType,{bi,parm})
	
end function

public constant xBiquadResonantFilter_getParamMax = define_c_func(sol,"+BiquadResonantFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function BiquadResonantFilter_getParamMax(atom bi,atom parm)

 return c_func(xBiquadResonantFilter_getParamMax,{bi,parm})
	
end function

public constant xBiquadResonantFilter_getParamMin = define_c_func(sol,"+BiquadResonantFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function BiquadResonantFilter_getParamMin(atom bi,atom parm)

 return c_func(xBiquadResonantFilter_getParamMin,{bi,parm})
	
end function

public constant xBiquadResonantFilter_create = define_c_func(sol,"+BiquadResonantFilter_create",{},C_POINTER)

public function BiquadResonantFilter_create()

 return c_func(xBiquadResonantFilter_create,{})
	
end function

public constant xBiquadResonantFilter_setParams = define_c_func(sol,"+BiquadResonantFilter_setParams",{C_POINTER,C_INT,C_FLOAT,C_FLOAT},C_INT)

public function BiquadResonantFilter_setParams(atom bi,atom xtype,atom freq,atom reso)

 return c_func(xBiquadResonantFilter_setParams,{bi,xtype,freq,reso})
	
end function

--Bus Functions

public constant xBus_destroy = define_c_proc(sol,"+Bus_destroy",{C_POINTER})

public procedure Bus_destroy(atom bus)

 c_proc(xBus_destroy,{bus})
	
end procedure

public constant xBus_create = define_c_func(sol,"+Bus_create",{},C_POINTER)

public function Bus_create()

 return c_func(xBus_create,{})
	
end function

public constant xBus_setFilter = define_c_proc(sol,"+Bus_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Bus_setFilter(atom bus,atom id,atom filt)

 c_proc(xBus_setFilter,{bus,id,filt})
	
end procedure

public constant xBus_play = define_c_func(sol,"+Bus_play",{C_POINTER,C_POINTER},C_UINT)

public function Bus_play(atom bus,atom so)

 return c_func(xBus_play,{bus,so})
	
end function

public constant xBus_playEx = define_c_func(sol,"+Bus_playEx",{C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_INT},C_UINT)

public function Bus_playEx(atom bus,atom so,atom vol,atom pan,atom pause)

 return c_func(xBus_playEx,{bus,so,vol,pan,pause})
	
end function

public constant xBus_playClocked = define_c_func(sol,"+Bus_playClocked",{C_POINTER,C_DOUBLE,C_POINTER},C_UINT)

public function Bus_playClocked(atom bus,atom xtime,atom so)

 return c_func(xBus_playClocked,{bus,xtime,so})
	
end function

public constant xBus_playClockedEx = define_c_func(sol,"+Bus_playClockedEx",{C_POINTER,C_DOUBLE,C_POINTER,C_FLOAT,C_FLOAT},C_UINT)

public function Bus_playClockedEx(atom bus,atom xtime,atom so,atom vol,atom pan)

 return c_func(xBus_playClockedEx,{bus,xtime,so,vol,pan})
	
end function

public constant xBus_play3d = define_c_func(sol,"+Bus_play3d",{C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT},C_UINT)

public function Bus_play3d(atom bus,atom so,atom x,atom y,atom z)

 return c_func(xBus_play3d,{bus,so,x,y,z})
	
end function

public constant xBus_play3dEx = define_c_func(sol,"+Bus_play3dEx",{C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT},C_UINT)

public function Bus_play3dEx(atom bus,atom so,atom x,atom y,atom z,atom vx,atom vy,atom vz,atom vol,atom pause)

 return c_func(xBus_play3dEx,{bus,so,x,y,z,vx,vy,vz,vol,pause})
	
end function

public constant xBus_play3dClocked = define_c_func(sol,"+Bus_play3dClocked",{C_POINTER,C_DOUBLE,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT},C_UINT)

public function Bus_play3dClocked(atom bus,atom xtime,atom so,atom x,atom y,atom z)

 return c_func(xBus_play3dClocked,{bus,xtime,so,x,y,z})
	
end function

public constant xBus_play3dClockedEx = define_c_func(sol,"+Bus_play3dClockedEx",{C_POINTER,C_DOUBLE,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_UINT)

public function Bus_play3dClockedEx(atom bus,atom xtime,atom so,atom x,atom y,atom z,atom vx,atom vy,atom vz,atom vol)

 return c_func(xBus_play3dClockedEx,{bus,xtime,so,x,y,z,vx,vy,vz,vol})
	
end function

public constant xBus_setChannels = define_c_func(sol,"+Bus_setChannels",{C_POINTER,C_UINT},C_INT)

public function Bus_setChannels(atom bus,atom chan)

 return c_func(xBus_setChannels,{bus,chan})
	
end function

public constant xBus_setVisualizationEnable = define_c_proc(sol,"+Bus_setVisualizationEnable",{C_POINTER,C_INT})

public procedure Bus_setVisualizationEnable(atom bus,atom en)

 c_proc(xBus_setVisualizationEnable,{bus,en})
	
end procedure

public constant xBus_annexSound = define_c_proc(sol,"+Bus_annexSound",{C_POINTER,C_UINT})

public procedure Bus_annexSound(atom bus,atom hand)

 c_proc(xBus_annexSound,{bus,hand})
	
end procedure

public constant xBus_calcFFT = define_c_func(sol,"+Bus_calcFFT",{C_POINTER},C_POINTER)

public function Bus_calcFFT(atom bus)

 return c_func(xBus_calcFFT,{bus})
	
end function

public constant xBus_getWave = define_c_func(sol,"+Bus_getWave",{C_POINTER},C_POINTER)

public function Bus_getWave(atom bus)

 return c_func(xBus_getWave,{bus})
	
end function

public constant xBus_getApproximateVolume = define_c_func(sol,"+Bus_getApproximateVolume",{C_POINTER,C_UINT},C_FLOAT)

public function Bus_getApproximateVolume(atom bus,atom chan)

 return c_func(xBus_getApproximateVolume,{bus,chan})
	
end function

public constant xBus_getActiveVoiceCount = define_c_func(sol,"+Bus_getActiveVoiceCount",{C_POINTER},C_UINT)

public function Bus_getActiveVoiceCount(atom bus)

 return c_func(xBus_getActiveVoiceCount,{bus})
	
end function

public constant xBus_setVolume = define_c_proc(sol,"+Bus_setVolume",{C_POINTER,C_FLOAT})

public procedure Bus_setVolume(atom bus,atom vol)

 c_proc(xBus_setVolume,{bus,vol})
	
end procedure

public constant xBus_setLooping = define_c_proc(sol,"+Bus_setLooping",{C_POINTER,C_INT})

public procedure Bus_setLooping(atom bus,atom lo)

 c_proc(xBus_setLooping,{bus,lo})
	
end procedure

public constant xBus_set3dMinMaxDistance = define_c_proc(sol,"+Bus_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Bus_set3dMinMaxDistance(atom bus,atom min,atom max)

 c_proc(xBus_set3dMinMaxDistance,{bus,min,max})
	
end procedure

public constant xBus_set3dAttenuation = define_c_proc(sol,"+Bus_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Bus_set3dAttenuation(atom bus,atom att,atom rol)

 c_proc(xBus_set3dAttenuation,{bus,att,rol})
	
end procedure

public constant xBus_set3dDopplerFactor = define_c_proc(sol,"+Bus_set3dDoppplerFactor",{C_POINTER,C_FLOAT})

public procedure Bus_set3dDopplerFactor(atom bus,atom dop)

 c_proc(xBus_set3dDopplerFactor,{bus,dop})
	
end procedure

public constant xBus_set3dListenerRelative = define_c_proc(sol,"+Bus_Set3dListenerRelative",{C_POINTER,C_INT})

public procedure Bus_set3dListenerRelative(atom bus,atom rel)

 c_proc(xBus_set3dListenerRelative,{bus,rel})
	
end procedure

public constant xBus_set3dDistance = define_c_proc(sol,"+Bus_set3dDistance",{C_POINTER,C_INT})

public procedure Bus_set3dDistance(atom bus,atom dist)

 c_proc(xBus_set3dDistance,{bus,dist})
	
end procedure

public constant xBus_set3dCollider = define_c_proc(sol,"+Bus_set3dCollider",{C_POINTER,C_POINTER})

public procedure Bus_set3dCollider(atom bus,atom col)

 c_proc(xBus_set3dCollider,{bus,col})
	
end procedure

public constant xBus_set3dColliderEx = define_c_proc(sol,"+Bus_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Bus_set3dColliderEx(atom bus,atom col,atom dat)

 c_proc(xBus_set3dColliderEx,{bus,col,dat})
	
end procedure

public constant xBus_set3dAttenuator = define_c_proc(sol,"+Bus_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Bus_set3dAttenuator(atom bus,atom att)

 c_proc(xBus_set3dAttenuator,{bus,att})
	
end procedure

public constant xBus_setInaudibleBehavior = define_c_proc(sol,"+Bus_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Bus_setInaudibleBehavior(atom bus,atom tick,atom kil)

 c_proc(xBus_setInaudibleBehavior,{bus,tick,kil})
	
end procedure

public constant xBus_setLoopPoint = define_c_proc(sol,"+Bus_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Bus_setLoopPoint(atom bus,atom lop)

 c_proc(xBus_setLoopPoint,{bus,lop})
	
end procedure

public constant xBus_getLoopPoint = define_c_func(sol,"+Bus_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Bus_getLoopPoint(atom bus)

 return c_func(xBus_getLoopPoint,{bus})
	
end function

public constant xBus_stop = define_c_proc(sol,"+Bus_stop",{C_POINTER})

public procedure Bus_stop(atom bus)

 c_proc(xBus_stop,{bus})
	
end procedure

--DCRemovalFilter Functions

public constant xDCRemovalFilter_destroy = define_c_proc(sol,"+DCRemovalFilter_destroy",{C_POINTER})

public procedure DCRemovalFilter_destroy(atom filt)

 c_proc(xDCRemovalFilter_destroy,{filt})
	
end procedure

public constant xDCRemovalFilter_create = define_c_func(sol,"+DCRemovalFilter_create",{},C_POINTER)

public function DCRemovalFilter_create()

 return c_func(xDCRemovalFilter_create,{})
	
end function

public constant xDCRemovalFilter_setParams = define_c_func(sol,"+DCRemovalFilter_setParams",{C_POINTER},C_INT)

public function DCRemovalFilter_setParams(atom filt)

 return c_func(xDCRemovalFilter_setParams,{filt})
	
end function

public constant xDCRemovalFilter_setParamsEx = define_c_func(sol,"+DCRemovalFilter_setParamsEx",{C_POINTER,C_FLOAT},C_INT)

public function DCRemovalFilter_setParamsEx(atom filt,atom len)

 return c_func(xDCRemovalFilter_setParamsEx,{filt,len})
	
end function

public constant xDCRemovalFilter_getParamCount = define_c_func(sol,"+DCRemovalFilter_getParamCount",{C_POINTER},C_INT)

public function DCRemovalFilter_getParamCount(atom dc)

 return c_func(xDCRemovalFilter_getParamCount,{dc})
	
end function

public constant xDCRemovalFilter_getParamName = define_c_func(sol,"+DCRemovalFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function DCRemovalFilter_getParamName(atom dc,atom idx)

 return c_func(xDCRemovalFilter_getParamName,{dc,idx})
	
end function

public constant xDCRemovalFilter_getParamType = define_c_func(sol,"+DCRemovalFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function DCRemovalFilter_getParamType(atom dc,atom idx)

 return c_func(xDCRemovalFilter_getParamType,{dc,idx})
	
end function

public constant xDCRemovalFilter_getParamMax = define_c_func(sol,"+DCRemovalFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function DCRemovalFilter_getParamMax(atom dc,atom idx)

 return c_func(xDCRemovalFilter_getParamMax,{dc,idx})
	
end function

public constant xDCRemovalFilter_getParamMin = define_c_func(sol,"+DCRemovalFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function DCRemovalFilter_getParamMin(atom dc,atom idx)

 return c_func(xDCRemovalFilter_getParamMin,{dc,idx})
	
end function

--EchoFilter Functions

public constant xEchoFilter_destroy = define_c_proc(sol,"+EchoFilter_destroy",{C_POINTER})

public procedure EchoFilter_destroy(atom echo)

 c_proc(xEchoFilter_destroy,{echo})
	
end procedure

public constant xEchoFilter_getParamCount = define_c_func(sol,"+EchoFilter_getParamCount",{C_POINTER},C_INT)

public function EchoFilter_getParamCount(atom echo)

 return c_func(xEchoFilter_getParamCount,{echo})
	
end function

public constant xEchoFilter_getParamName = define_c_func(sol,"+EchoFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function EchoFilter_getParamName(atom echo,atom idx)

 return c_func(xEchoFilter_getParamName,{echo,idx})
	
end function

public constant xEchoFilter_getParamType = define_c_func(sol,"+EchoFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function EchoFilter_getParamType(atom echo,atom idx)

 return c_func(xEchoFilter_getParamType,{echo,idx})
	
end function

public constant xEchoFilter_getParamMax = define_c_func(sol,"+EchoFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function EchoFilter_getParamMax(atom echo,atom idx)

 return c_func(xEchoFilter_getParamMax,{echo,idx})
	
end function

public constant xEchoFilter_getParamMin = define_c_func(sol,"+EchoFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function EchoFilter_getParamMin(atom echo,atom idx)

 return c_func(xEchoFilter_getParamMin,{echo,idx})
	
end function

public constant xEchoFilter_create = define_c_func(sol,"+EchoFilter_create",{},C_POINTER)

public function EchoFilter_create()

 return c_func(xEchoFilter_create,{})
	
end function

public constant xEchoFilter_setParams = define_c_func(sol,"+EchoFilter_setParams",{C_POINTER,C_FLOAT},C_INT)

public function EchoFilter_setParams(atom echo,atom delay)

 return c_func(xEchoFilter_setParams,{echo,delay})
	
end function

public constant xEchoFilter_setParamsEx = define_c_func(sol,"+EchoFilter_setParamsEx",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT},C_INT)

public function EchoFilter_setParamsEx(atom echo,atom delay,atom decay,atom filt)

 return c_func(xEchoFilter_setParamsEx,{echo,delay,decay,filt})
	
end function

--FFTFilter Functions

public constant xFFTFilter_destroy = define_c_proc(sol,"+FFTFilter_destroy",{C_POINTER})

public procedure FFTFilter_destroy(atom filt)

 c_proc(xFFTFilter_destroy,{filt})
	
end procedure

public constant xFFTFilter_create = define_c_func(sol,"+FFTFilter_create",{},C_POINTER)

public function FFTFilter_create()

 return c_func(xFFTFilter_create,{})
	
end function

public constant xFFTFilter_getParamCount = define_c_func(sol,"+FFTFilter_getParamCount",{C_POINTER},C_INT)

public function FFTFilter_getParamCount(atom filt)

 return c_func(xFFTFilter_getParamCount,{filt})
	
end function

public constant xFFTFilter_getParamName = define_c_func(sol,"+FFTFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function FFTFilter_getParamName(atom filt,atom idx)

 return c_func(xFFTFilter_getParamName,{filt,idx})
	
end function

public constant xFFTFilter_getParamType = define_c_func(sol,"+FFTFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function FFTFilter_getParamType(atom filt,atom idx)

 return c_func(xFFTFilter_getParamType,{filt,idx})
	
end function

public constant xFFTFilter_getParamMax = define_c_func(sol,"+FFTFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function FFTFilter_getParamMax(atom filt,atom idx)

 return c_func(xFFTFilter_getParamMax,{filt,idx})
	
end function

public constant xFFTFilter_getParamMin = define_c_func(sol,"+FFTFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function FFTFilter_getParamMin(atom filt,atom idx)

 return c_func(xFFTFilter_getParamMin,{filt,idx})
	
end function

--FlangerFilter Functions

public constant xFlangerFilter_destroy = define_c_proc(sol,"+FlangerFilter_destroy",{C_POINTER})

public procedure FlangerFilter_destroy(atom filt)

 c_proc(xFlangerFilter_destroy,{filt})
	
end procedure

public constant xFlangerFilter_getParamCount = define_c_func(sol,"+FlangerFilter_getParamCount",{C_POINTER},C_INT)

public function FlangerFilter_getParamCount(atom filt)

 return c_func(xFlangerFilter_getParamCount,{filt})
	
end function

public constant xFlangerFilter_getParamName = define_c_func(sol,"+FlangerFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function FlangerFilter_getParamName(atom filt,atom idx)

 return c_func(xFlangerFilter_getParamName,{filt,idx})
	
end function

public constant xFlangerFilter_getParamType = define_c_func(sol,"+FlangerFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function FlangerFilter_getParamType(atom filt,atom idx)
 
 return c_func(xFlangerFilter_getParamType,{filt,idx})
	
end function

public constant xFlangerFilter_getParamMax = define_c_func(sol,"+FlangerFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function FlangerFilter_getParamMax(atom filt,atom idx)

 return c_func(xFlangerFilter_getParamMax,{filt,idx})
	
end function

public constant xFlangerFilter_getParamMin = define_c_func(sol,"+FlangerFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function FlangerFilter_getParamMin(atom filt,atom idx)

 return c_func(xFlangerFilter_getParamMin,{filt,idx})
	
end function

public constant xFlangerFilter_create = define_c_func(sol,"+FlangerFilter_create",{},C_POINTER)

public function FlangerFilter_create()

 return c_func(xFlangerFilter_create,{})
	
end function

public constant xFlangerFilter_setParams = define_c_func(sol,"+FlangerFilter_setParams",{C_POINTER,C_FLOAT,C_FLOAT},C_INT)

public function FlangerFilter_setParams(atom filt,atom delay,atom freq)

 return c_func(xFlangerFilter_setParams,{filt,delay,freq})
	
end function

--FreeverbFilter Functions

public constant xFreeverbFilter_destroy = define_c_proc(sol,"+FreeverbFilter_destroy",{C_POINTER})

public procedure FreeverbFilter_destroy(atom filt)

 c_proc(xFreeverbFilter_destroy,{filt})
	
end procedure

public constant xFreeverbFilter_getParamCount = define_c_func(sol,"+FreeverbFilter_getParamCount",{C_POINTER},C_INT)

public function FreeverbFilter_getParamCount(atom filt)

 return c_func(xFreeverbFilter_getParamCount,{filt})
	
end function

public constant xFreeverbFilter_getParamName = define_c_func(sol,"+FreeverbFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function FreeverbFilter_getParamName(atom filt,atom idx)

 return c_func(xFreeverbFilter_getParamName,{filt,idx})
	
end function

public constant xFreeverbFilter_getParamType = define_c_func(sol,"+FreeverbFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function FreeverbFilter_getParamType(atom filt,atom idx)

 return c_func(xFreeverbFilter_getParamType,{filt,idx})
	
end function

public constant xFreeverbFilter_getParamMax = define_c_func(sol,"+FreeverbFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function FreeverbFilter_getParamMax(atom filt,atom idx)

 return c_func(xFreeverbFilter_getParamMax,{filt,idx})
	
end function

public constant xFreeverbFilter_getParamMin = define_c_func(sol,"+FreeverbFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function FreeverbFilter_getParamMin(atom filt,atom idx)

 return c_func(xFreeverbFilter_getParamMin,{filt,idx})
	
end function

public constant xFreeverbFilter_create = define_c_func(sol,"+FreeverbFilter_create",{},C_POINTER)

public function FreeverbFilter_create()

 return c_func(xFreeverbFilter_create,{})
	
end function

public constant xFreeverbFilter_setParams = define_c_func(sol,"+FreeverbFilter_setParams",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_INT)

public function FreeverbFilter_setParams(atom filt,atom mode,atom size,atom damp,atom w)

 return c_func(xFreeverbFilter_setParams,{filt,mode,size,damp,w})
	
end function

--LofiFilter Functions

public constant xLofiFilter_destroy = define_c_proc(sol,"+LofiFilter_destroy",{C_POINTER})

public procedure LofiFilter_destroy(atom filt)

 c_proc(xLofiFilter_destroy,{filt})
	
end procedure

public constant xLofiFilter_getParamCount = define_c_func(sol,"+LofiFilter_getParamCount",{C_POINTER},C_INT)

public function LofiFilter_getParamCount(atom filt)

 return c_func(xLofiFilter_getParamCount,{filt})
	
end function

public constant xLofiFilter_getParamName = define_c_func(sol,"+LofiFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function LofiFilter_getParamName(atom filt,atom idx)

 return c_func(xLofiFilter_getParamName,{filt,idx})
	
end function

public constant xLofiFilter_getParamType = define_c_func(sol,"+LofiFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function LofiFilter_getParamType(atom filt,atom idx)

 return c_func(xLofiFilter_getParamType,{filt,idx})
	
end function

public constant xLofiFilter_getParamMax = define_c_func(sol,"+LofiFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function LofiFilter_getParamMax(atom filt,atom idx)

 return c_func(xLofiFilter_getParamMax,{filt,idx})
	
end function

public constant xLofiFilter_getParamMin = define_c_func(sol,"+LofiFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function LofiFilter_getParamMin(atom filt,atom idx)

 return c_func(xLofiFilter_getParamMin,{filt,idx})
	
end function

public constant xLofiFilter_create = define_c_func(sol,"+LofiFilter_create",{},C_POINTER)

public function LofiFilter_create()

 return c_func(xLofiFilter_create,{})
	
end function

public constant xLofiFilter_setParams = define_c_func(sol,"+LofiFilter_setParams",{C_POINTER,C_FLOAT,C_FLOAT},C_INT)

public function LofiFilter_setParams(atom filt,atom rate,atom bit)

 return c_func(xLofiFilter_setParams,{filt,rate,bit})
	
end function

--Monotone Functions

public constant xMonotone_destroy = define_c_proc(sol,"+Monotone_destroy",{C_POINTER})

public procedure Monotone_destroy(atom mono)

 c_proc(xMonotone_destroy,{mono})
	
end procedure

public constant xMonotone_create = define_c_func(sol,"+Monotone_create",{},C_POINTER)

public function Monotone_create()

 return c_func(xMonotone_create,{})
	
end function

public constant xMonotone_setParams = define_c_func(sol,"+Monotone_setParams",{C_POINTER,C_INT},C_INT)

public function Monotone_setParams(atom mono,atom chan)

 return c_func(xMonotone_setParams,{mono,chan})
	
end function

public constant xMonotone_setParamsEx = define_c_func(sol,"+Monotone_setParamsEx",{C_POINTER,C_INT,C_INT},C_INT)

public function Monotone_setParamsEx(atom mono,atom chan,atom wfo)

 return c_func(xMonotone_setParamsEx,{mono,chan,wfo})
	
end function

public constant xMonotone_load = define_c_func(sol,"+Monotone_load",{C_POINTER,C_STRING},C_INT)

public function Monotone_load(atom mono,sequence file)
 
 return c_func(xMonotone_load,{mono,file})
	
end function

public constant xMonotone_loadMem = define_c_func(sol,"+Monotone_loadMem",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Monotone_loadMem(atom mono,atom mem,atom len)

 return c_func(xMonotone_loadMem,{mono,mem,len})
	
end function

public constant xMonotone_loadMemEx = define_c_func(sol,"+Monotone_loadMemEx",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT},C_INT)

public function Monotone_loadMemEx(atom mono,atom mem,atom len,atom co,atom own)

 return c_func(xMonotone_loadMemEx,{mono,mem,len,co,own})
	
end function

public constant xMonotone_loadFile = define_c_func(sol,"+Monotone_loadFile",{C_POINTER,C_POINTER},C_INT)

public function Monotone_loadFile(atom mono,atom file)

 return c_func(xMonotone_loadFile,{mono,file})
	
end function

public constant xMonotone_setVolume = define_c_proc(sol,"+Monotone_setVolume",{C_POINTER,C_FLOAT})

public procedure Monotone_setVolume(atom mono,atom vol)

 c_proc(xMonotone_setVolume,{mono,vol})
	
end procedure

public constant xMonotone_setLooping = define_c_proc(sol,"+Monotone_setLooping",{C_POINTER,C_INT})

public procedure Monotone_setLooping(atom mono,atom lop)

 c_proc(xMonotone_setLooping,{mono,lop})
	
end procedure

public constant xMonotone_set3dMinMaxDistance = define_c_proc(sol,"+Monotone_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Monotone_set3dMinMaxDistance(atom mono,atom min,atom max)

 c_proc(xMonotone_set3dMinMaxDistance,{mono,min,max})
	
end procedure

public constant xMonotone_set3dAttenuation = define_c_proc(sol,"+Monotone_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Monotone_set3dAttenuation(atom mono,atom mod,atom rol)

 c_proc(xMonotone_set3dAttenuation,{mono,mod,rol})
	
end procedure

public constant xMonotone_set3dDopplerFactor = define_c_proc(sol,"+Monotone_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Monotone_set3dDopplerFactor(atom mono,atom dop)

 c_proc(xMonotone_set3dDopplerFactor,{mono,dop})
	
end procedure

public constant xMonotone_set3dListenerRelative = define_c_proc(sol,"+Monotone_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Monotone_set3dListenerRelative(atom mono,atom rel)

 c_proc(xMonotone_set3dListenerRelative,{mono,rel})
	
end procedure

public constant xMonotone_set3dDistanceDelay = define_c_proc(sol,"+Monotone_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Monotone_set3dDistanceDelay(atom mono,atom delay)

 c_proc(xMonotone_set3dDistanceDelay,{mono,delay})
	
end procedure

public constant xMonotone_set3dCollider = define_c_proc(sol,"+Monotone_set3dCollider",{C_POINTER,C_POINTER})

public procedure Monotone_set3dCollider(atom mono,atom col)

 c_proc(xMonotone_set3dCollider,{mono,col})
	
end procedure

public constant xMonotone_set3dColliderEx = define_c_proc(sol,"+Monotone_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Monotone_set3dColliderEx(atom mono,atom col,atom dat)

 c_proc(xMonotone_set3dColliderEx,{mono,col,dat})
	
end procedure

public constant xMonotone_set3dAttenuator = define_c_proc(sol,"+Monotone_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Monotone_set3dAttenuator(atom mono,atom att)

 c_proc(xMonotone_set3dAttenuator,{mono,att})
	
end procedure

public constant xMonotone_setInaudibleBehavior = define_c_proc(sol,"+Monotone_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Monotone_setInaudibleBehavior(atom mono,atom tick,atom kil)

 c_proc(xMonotone_setInaudibleBehavior,{mono,tick,kil})
	
end procedure

public constant xMonotone_setLoopPoint = define_c_proc(sol,"+Monotone_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Monotone_setLoopPoint(atom mono,atom pt)

 c_proc(xMonotone_setLoopPoint,{mono,pt})
	
end procedure

public constant xMonotone_getLoopPoint = define_c_func(sol,"+Monotone_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Monotone_getLoopPoint(atom mono)

 return c_func(xMonotone_getLoopPoint,{mono})
	
end function

public constant xMonotone_setFilter = define_c_proc(sol,"+Monotone_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Monotone_setFilter(atom mono,atom id,atom filt)

 c_proc(xMonotone_setFilter,{mono,id,filt})
	
end procedure

public constant xMonotone_stop = define_c_proc(sol,"+Monotone_stop",{C_POINTER})

public procedure Monotone_stop(atom mono)

 c_proc(xMonotone_stop,{mono})
	
end procedure

--Noise Functions

public constant xNoise_destroy = define_c_proc(sol,"+Noise_destroy",{C_POINTER})

public procedure Noise_destroy(atom noi)

 c_proc(xNoise_destroy,{noi})
	
end procedure

public constant xNoise_create = define_c_func(sol,"+Noise_create",{},C_POINTER)

public function Noise_create()

 return c_func(xNoise_create,{})
	
end function

public constant xNoise_setOctaveScale = define_c_proc(sol,"+Noise_setOctaveScale",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure Noise_setOctaveScale(atom noise,atom oct,atom oct2,atom oct3,atom oct4,atom oct5,atom oct6,atom oct7,atom oct8,atom oct9)

 c_proc(xNoise_setOctaveScale,{noise,oct,oct2,oct3,oct4,oct5,oct6,oct7,oct8,oct9})
	
end procedure

public constant xNoise_setType = define_c_proc(sol,"+Noise_setType",{C_POINTER,C_INT})

public procedure Noise_setType(atom noi,atom xtype)

 c_proc(xNoise_setType,{noi,xtype})
	
end procedure

public constant xNoise_setVolume = define_c_proc(sol,"+Noise_setVolume",{C_POINTER,C_FLOAT})

public procedure Noise_setVolume(atom noi,atom vol)

 c_proc(xNoise_setVolume,{noi,vol})
	
end procedure

public constant xNoise_setLooping = define_c_proc(sol,"+Noise_setLooping",{C_POINTER,C_INT})

public procedure Noise_setLooping(atom noi,atom lop)

 c_proc(xNoise_setLooping,{noi,lop})
	
end procedure

public constant xNoise_set3dMinMaxDistance = define_c_proc(sol,"+Noise_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Noise_set3dMinMaxDistance(atom noi,atom min,atom max)

 c_proc(xNoise_set3dMinMaxDistance,{noi,min,max})
	
end procedure

public constant xNoise_set3dAttenuation = define_c_proc(sol,"+Noise_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Noise_set3dAttenuation(atom noi,atom att,atom roll)

 c_proc(xNoise_set3dAttenuation,{noi,att,roll})
	
end procedure

public constant xNoise_set3dDopplerFactor = define_c_proc(sol,"+Noise_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Noise_set3dDopplerFactor(atom noi,atom dop)

 c_proc(xNoise_set3dDopplerFactor,{noi,dop})
	
end procedure

public constant xNoise_set3dListenerRelative = define_c_proc(sol,"+Noise_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Noise_set3dListenerRelative(atom noi,atom lis)

 c_proc(xNoise_set3dListenerRelative,{noi,lis})
	
end procedure

public constant xNoise_set3dCollider = define_c_proc(sol,"+Noise_set3dCollider",{C_POINTER,C_POINTER})

public procedure Noise_set3dCollider(atom noi,atom col)

 c_proc(xNoise_set3dCollider,{noi,col})
	
end procedure

public constant xNoise_set3dColliderEx = define_c_proc(sol,"+Noise_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Noise_set3dColliderEx(atom noi,atom col,atom dat)

 c_proc(xNoise_set3dColliderEx,{noi,col,dat})
	
end procedure

public constant xNoise_set3dAttenuator = define_c_proc(sol,"+Noise_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Noise_set3dAttenuator(atom noi,atom att)

 c_proc(xNoise_set3dAttenuator,{noi,att})
	
end procedure

public constant xNoise_setInaudibleBehavior = define_c_proc(sol,"+Noise_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Noise_setInaudibleBehavior(atom noi,atom tick,atom kil)

 c_proc(xNoise_setInaudibleBehavior,{noi,tick,kil})
	
end procedure

public constant xNoise_setLoopPoint = define_c_proc(sol,"+Noise_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Noise_setLoopPoint(atom ni,atom pt)

 c_proc(xNoise_setLoopPoint,{ni,pt})
	
end procedure

public constant xNoise_getLoopPoint = define_c_func(sol,"+Noise_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Noise_getLoopPoint(atom noi)

 return c_func(xNoise_getLoopPoint,{noi})
	
end function

public constant xNoise_setFilter = define_c_proc(sol,"+Noise_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Noise_setFilter(atom noi,atom id,atom filt)

 c_proc(xNoise_setFilter,{noi,id,filt})
	
end procedure

public constant xNoise_stop = define_c_proc(sol,"+Noise_stop",{C_POINTER})

public procedure Noise_stop(atom noi)

 c_proc(xNoise_stop,{noi})
	
end procedure

--Openmpt Functions

public constant xOpenmpt_destroy = define_c_proc(sol,"+Openmpt_destroy",{C_POINTER})

public procedure Openmpt_destroy(atom m)

 c_proc(xOpenmpt_destroy,{m})
	
end procedure

public constant xOpenmpt_create = define_c_func(sol,"+Openmpt_create",{},C_POINTER)

public function Openmpt_create()

 return c_func(xOpenmpt_create,{})
	
end function

public constant xOpenmpt_load = define_c_func(sol,"+Openmpt_load",{C_POINTER,C_STRING},C_INT)

public function Openmpt_load(atom m,sequence file)
 
 return c_func(xOpenmpt_load,{m,file})
	
end function

public constant xOpenmpt_loadMem = define_c_func(sol,"+Openmpt_loadMem",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Openmpt_loadMem(atom m,atom mem,atom len)

 return c_func(xOpenmpt_loadMem,{m,mem,len})
	
end function

public constant xOpenmpt_loadMemEx = define_c_func(sol,"+Openmpt_loadMemEx",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT},C_INT)

public function Openmpt_loadMemEx(atom m,atom mem,atom len,atom cop,atom own)

 return c_func(xOpenmpt_loadMemEx,{m,mem,len,cop,own})
	
end function

public constant xOpenmpt_loadFile = define_c_func(sol,"+Openmpt_loadFile",{C_POINTER,C_POINTER},C_INT)

public function Openmpt_loadFile(atom m,atom file)

 return c_func(xOpenmpt_loadFile,{m,file})
	
end function

public constant xOpenmpt_setVolume = define_c_proc(sol,"+Openmpt_setVolume",{C_POINTER,C_FLOAT})

public procedure Openmpt_setVolume(atom m,atom vol)

 c_proc(xOpenmpt_setVolume,{m,vol})
	
end procedure

public constant xOpenmpt_setLooping = define_c_proc(sol,"+Openmpt_setLooping",{C_POINTER,C_INT})

public procedure Openmpt_setLooping(atom m,atom lop)

 c_proc(xOpenmpt_setLooping,{m,lop})
	
end procedure

public constant xOpenmpt_set3dMinMaxDistance = define_c_proc(sol,"+Openmpt_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Openmpt_set3dMinMaxDistance(atom m,atom min,atom max)

 c_proc(xOpenmpt_set3dMinMaxDistance,{m,min,max})
	
end procedure

public constant xOpenmpt_set3dAttenuation = define_c_proc(sol,"+Openmpt_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Openmpt_set3dAttenuation(atom m,atom att,atom roll)

 c_proc(xOpenmpt_set3dAttenuation,{m,att,roll})
	
end procedure

public constant xOpenmpt_set3dDopplerFactor = define_c_proc(sol,"+Openmpt_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Openmpt_set3dDopplerFactor(atom m,atom dop)

 c_proc(xOpenmpt_set3dDopplerFactor,{m,dop})
	
end procedure

public constant xOpenmpt_set3dListenerRelative = define_c_proc(sol,"+Openmpt_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Openmpt_set3dListenerRelative(atom m,atom rel)

 c_proc(xOpenmpt_set3dListenerRelative,{m,rel})
	
end procedure

public constant xOpenmpt_set3dDistanceDelay = define_c_proc(sol,"+Openmpt_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Openmpt_set3dDistanceDelay(atom m,atom dis)

 c_proc(xOpenmpt_set3dDistanceDelay,{m,dis})
	
end procedure

public constant xOpenmpt_set3dCollider = define_c_proc(sol,"+Openmpt_set3dCollider",{C_POINTER,C_POINTER})

public procedure Openmpt_set3dCollider(atom m,atom col)

 c_proc(xOpenmpt_set3dCollider,{m,col})
	
end procedure

public constant xOpenmpt_set3dColliderEx = define_c_proc(sol,"+Openmpt_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Openmpt_set3dColliderEx(atom m,atom col,atom dat)

 c_proc(xOpenmpt_set3dColliderEx,{m,col,dat})
	
end procedure

public constant xOpenmpt_set3dAttenuator = define_c_proc(sol,"+Openmpt_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Openmpt_set3dAttenuator(atom m,atom att)

 c_proc(xOpenmpt_set3dAttenuator,{m,att})
	
end procedure

public constant xOpenmpt_setInaudibleBehavior = define_c_proc(sol,"+Openmpt_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Openmpt_setInaudibleBehavior(atom m,atom tick,atom kil)

 c_proc(xOpenmpt_setInaudibleBehavior,{m,tick,kil})
	
end procedure

public constant xOpenmpt_setLoopPoint = define_c_proc(sol,"+Openmpt_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Openmpt_setLoopPoint(atom m,atom pt)

 c_proc(xOpenmpt_setLoopPoint,{m,pt})
	
end procedure

public constant xOpenmpt_getLoopPoint = define_c_func(sol,"+Openmpt_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Openmpt_getLoopPoint(atom m)

 return c_func(xOpenmpt_getLoopPoint,{m})
	
end function

public constant xOpenmpt_setFilter = define_c_proc(sol,"+Openmpt_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Openmpt_setFilter(atom m,atom id,atom filt)

 c_proc(xOpenmpt_setFilter,{m,id,filt})
	
end procedure

public constant xOpenmpt_stop = define_c_proc(sol,"+Openmpt_stop",{C_POINTER})

public procedure Openmpt_stop(atom m)

 c_proc(xOpenmpt_stop,{m})
	
end procedure

--Queue Functions

public constant xQueue_destroy = define_c_proc(sol,"+Queue_destroy",{C_POINTER})

public procedure Queue_destroy(atom q)

 c_proc(xQueue_destroy,{q})
	
end procedure

public constant xQueue_create = define_c_func(sol,"+Queue_create",{},C_POINTER)

public function Queue_create()

 return c_func(xQueue_create,{})
	
end function

public constant xQueue_play = define_c_func(sol,"+Queue_play",{C_POINTER,C_POINTER},C_INT)

public function Queue_play(atom q,atom s)

 return c_func(xQueue_play,{q,s})
	
end function

public constant xQueue_getQueueCount = define_c_func(sol,"+Queue_getQueueCount",{C_POINTER},C_UINT)

public function Queue_getQueueCount(atom q)

 return c_func(xQueue_getQueueCount,{q})
	
end function

public constant xQueue_isCurrentlyPlaying = define_c_func(sol,"+Queue_isCurrentlyPlaying",{C_POINTER,C_POINTER},C_INT)

public function Queue_isCurrentlyPlaying(atom q,atom s)

 return c_func(xQueue_isCurrentlyPlaying,{q,s})
	
end function

public constant xQueue_setParamsFromAudioSource = define_c_func(sol,"+Queue_setParamsFromAudioSource",{C_POINTER,C_POINTER},C_INT)

public function Queue_setParamsFromAudioSource(atom q,atom s)

 return c_func(xQueue_setParamsFromAudioSource,{q,s})
	
end function

public constant xQueue_setParams = define_c_func(sol,"+Queue_setParams",{C_POINTER,C_FLOAT},C_INT)

public function Queue_setParams(atom q,atom r)

 return c_func(xQueue_setParams,{q,r})
	
end function

public constant xQueue_setParamsEx = define_c_func(sol,"+Queue_setParamsEx",{C_POINTER,C_FLOAT,C_INT},C_INT)

public function Queue_setParamsEx(atom q,atom r,atom c)

 return c_func(xQueue_setParamsEx,{q,r,c})
	
end function

public constant xQueue_setVolume = define_c_proc(sol,"+Queue_setVolume",{C_POINTER,C_FLOAT})

public procedure Queue_setVolume(atom q,atom vol)

 c_proc(xQueue_setVolume,{q,vol})
	
end procedure

public constant xQueue_setLooping = define_c_proc(sol,"+Queue_setLooping",{C_POINTER,C_INT})

public procedure Queue_setLooping(atom q,atom lop)

 c_proc(xQueue_setLooping,{q,lop})
	
end procedure

public constant xQueue_set3dMinMaxDistance = define_c_proc(sol,"+Queue_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Queue_set3dMinMaxDistance(atom q,atom min,atom max)

 c_proc(xQueue_set3dMinMaxDistance,{q,min,max})
	
end procedure

public constant xQueue_set3dAttenuation = define_c_proc(sol,"+Queue_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Queue_set3dAttenuation(atom q,atom att,atom roll)

 c_proc(xQueue_set3dAttenuation,{q,att,roll})
	
end procedure

public constant xQueue_set3dDopplerFactor = define_c_proc(sol,"+Queue_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Queue_set3dDopplerFactor(atom q,atom dop)

 c_proc(xQueue_set3dDopplerFactor,{q,dop})
	
end procedure

public constant xQueue_set3dListenerRelative = define_c_proc(sol,"+Queue_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Queue_set3dListenerRelative(atom q,atom l)

 c_proc(xQueue_set3dListenerRelative,{q,l})
	
end procedure

public constant xQueue_set3dDistanceDelay = define_c_proc(sol,"+Queue_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Queue_set3dDistanceDelay(atom q,atom de)

 c_proc(xQueue_set3dDistanceDelay,{q,de})
	
end procedure

public constant xQueue_set3dCollider = define_c_proc(sol,"+Queue_set3dCollider",{C_POINTER,C_POINTER})

public procedure Queue_set3dCollider(atom q,atom col)

 c_proc(xQueue_set3dCollider,{q,col})
	
end procedure

public constant xQueue_set3dColliderEx = define_c_proc(sol,"+Queue_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Queue_set3dColliderEx(atom q,atom col,atom dat)

 c_proc(xQueue_set3dColliderEx,{q,col,dat})
	
end procedure

public constant xQueue_set3dAttenuator = define_c_proc(sol,"+Queue_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Queue_set3dAttenuator(atom q,atom a)

 c_proc(xQueue_set3dAttenuator,{q,a})
	
end procedure

public constant xQueue_setInaudibleBehavior = define_c_proc(sol,"+Queue_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Queue_setInaudibleBehavior(atom q,atom t,atom k)

 c_proc(xQueue_setInaudibleBehavior,{q,t,k})
	
end procedure

public constant xQueue_setLoopPoint = define_c_proc(sol,"+Queue_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Queue_setLoopPoint(atom q,atom pt)

 c_proc(xQueue_setLoopPoint,{q,pt})
	
end procedure

public constant xQueue_getLoopPoint = define_c_func(sol,"+Queue_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Queue_getLoopPoint(atom q)

 return c_func(xQueue_getLoopPoint,{q})
	
end function

public constant xQueue_setFilter = define_c_proc(sol,"+Queue_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Queue_setFilter(atom q,atom id,atom filt)

 c_proc(xQueue_setFilter,{q,id,filt})
	
end procedure

public constant xQueue_stop = define_c_proc(sol,"+Queue_stop",{C_POINTER})

public procedure Queue_stop(atom q)

 c_proc(xQueue_stop,{q})
	
end procedure

--RobotizeFilter Functions

public constant xRobotizeFilter_destroy = define_c_proc(sol,"+RobotizeFilter_destroy",{C_POINTER})

public procedure RobotizeFilter_destroy(atom f)

 c_proc(xRobotizeFilter_destroy,{f})
	
end procedure

public constant xRobotizeFilter_getParamCount = define_c_func(sol,"+RobotizeFilter_getParamCount",{C_POINTER},C_INT)

public function RobotizeFilter_getParamCount(atom f)

 return c_func(xRobotizeFilter_getParamCount,{f})
	
end function

public constant xRobotizeFilter_getParamName = define_c_func(sol,"+RobotizeFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function RobotizeFilter_getParamName(atom f,atom i)

 return c_func(xRobotizeFilter_getParamName,{f,i})
	
end function

public constant xRobotizeFilter_getParamType = define_c_func(sol,"+RobotizeFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function RobotizeFilter_getParamType(atom f,atom i)

 return c_func(xRobotizeFilter_getParamType,{f,i})
	
end function

public constant xRobotizeFilter_getParamMax = define_c_func(sol,"+RobotizeFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function RobotizeFilter_getParamMax(atom f,atom i)

 return c_func(xRobotizeFilter_getParamMax,{f,i})
	
end function

public constant xRobotizeFilter_getParamMin = define_c_func(sol,"+RobotizeFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function RobotizeFilter_getParamMin(atom f,atom i)

 return c_func(xRobotizeFilter_getParamMin,{f,i})
	
end function

public constant xRobotizeFilter_setParams = define_c_proc(sol,"+RobotizeFilter_setParams",{C_POINTER,C_FLOAT,C_INT})

public procedure RobotizeFilter_setParams(atom f,atom fr,atom w)

 c_proc(xRobotizeFilter_setParams,{f,fr,w})
	
end procedure

public constant xRobotizeFilter_create = define_c_func(sol,"+RobotizeFilter_create",{},C_POINTER)

public function RobotizeFilter_create()

 return c_func(xRobotizeFilter_create,{})
	
end function

--Sfxr Functions

public constant xSfxr_destroy = define_c_proc(sol,"+Sfxr_destroy",{C_POINTER})

public procedure Sfxr_destroy(atom s)

 c_proc(xSfxr_destroy,{s})
	
end procedure

public constant xSfxr_create = define_c_func(sol,"+Sfxr_create",{},C_POINTER)

public function Sfxr_create()

 return c_func(xSfxr_create,{})
	
end function

public constant xSfxr_resetParams = define_c_proc(sol,"+Sfxr_resetParams",{C_POINTER})

public procedure Sfxr_resetParams(atom s)

 c_proc(xSfxr_resetParams,{s})
	
end procedure

public constant xSfxr_loadParams = define_c_func(sol,"+Sfxr_loadParams",{C_POINTER,C_STRING},C_INT)

public function Sfxr_loadParams(atom s,sequence file)

 return c_func(xSfxr_loadParams,{s,file})
	
end function

public constant xSfxr_loadParamsMem = define_c_func(sol,"+Sfxr_loadParamsMem",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Sfxr_loadParamsMem(atom s,atom mem,atom len)

 return c_func(xSfxr_loadParamsMem,{s,mem,len})
	
end function

public constant xSfxr_loadParamsMemEx = define_c_func(sol,"+Sfxr_loadParamsMemEx",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT},C_INT)

public function Sfxr_loadParamsMemEx(atom s,atom mem,atom len,atom cop,atom own)

 return c_func(xSfxr_loadParamsMemEx,{s,mem,len,cop,own})
	
end function

public constant xSfxr_loadParamsFile = define_c_func(sol,"+Sfxr_loadParamsFile",{C_POINTER,C_POINTER},C_INT)

public function Sfxr_loadParamsFile(atom s,atom file)

 return c_func(xSfxr_loadParamsFile,{s,file})
	
end function

public constant xSfxr_loadPreset =  define_c_func(sol,"+Sfxr_loadPreset",{C_POINTER,C_INT,C_INT},C_INT)

public function Sfxr_loadPreset(atom s,atom no,atom ran)

 return c_func(xSfxr_loadPreset,{s,no,ran})
	
end function

public constant xSfxr_setVolume = define_c_proc(sol,"+Sfxr_setVolume",{C_POINTER,C_FLOAT})

public procedure Sfxr_setVolume(atom s,atom vol)

 c_proc(xSfxr_setVolume,{s,vol})
	
end procedure

public constant xSfxr_setLooping = define_c_proc(sol,"+Sfxr_setLooping",{C_POINTER,C_INT})

public procedure Sfxr_setLooping(atom s,atom lop)

 c_proc(xSfxr_setLooping,{s,lop})
	
end procedure

public constant xSfxr_set3dMinMaxDistance = define_c_proc(sol,"+Sfxr_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Sfxr_set3dMinMaxDistance(atom s,atom min,atom max)

 c_proc(xSfxr_set3dMinMaxDistance,{s,min,max})
	
end procedure

public constant xSfxr_set3dAttenuation = define_c_proc(sol,"+Sfxr_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Sfxr_set3dAttenuation(atom s,atom mod,atom rol)

 c_proc(xSfxr_set3dAttenuation,{s,mod,rol})
	
end procedure

public constant xSfxr_set3dDopplerFactor = define_c_proc(sol,"+Sfxr_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Sfxr_set3dDopplerFactor(atom s,atom dop)

 c_proc(xSfxr_set3dDopplerFactor,{s,dop})
	
end procedure

public constant xSfxr_set3dListenerRelative = define_c_proc(sol,"+Sfxr_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Sfxr_set3dListenerRelative(atom s,atom rel)

 c_proc(xSfxr_set3dListenerRelative,{s,rel})
	
end procedure

public constant xSfxr_set3dDistanceDelay = define_c_proc(sol,"+Sfxr_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Sfxr_set3dDistanceDelay(atom s,atom dis)

 c_proc(xSfxr_set3dDistanceDelay,{s,dis})
	
end procedure

public constant xSfxr_set3dCollider = define_c_proc(sol,"+Sfxr_set3dCollider",{C_POINTER,C_POINTER})

public procedure Sfxr_set3dCollider(atom s,atom col)

 c_proc(xSfxr_set3dCollider,{s,col})
	
end procedure

public constant xSfxr_set3dColliderEx = define_c_proc(sol,"+Sfxr_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Sfxr_set3dColliderEx(atom s,atom col,atom dat)

 c_proc(xSfxr_set3dColliderEx,{s,col,dat})
	
end procedure

public constant xSfxr_set3dAttenuator = define_c_proc(sol,"+Sfxr_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Sfxr_set3dAttenuator(atom s,atom a)

 c_proc(xSfxr_set3dAttenuator,{s,a})
	
end procedure

public constant xSfxr_setInaudibleBehavior = define_c_proc(sol,"+Sfxr_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Sfxr_setInaudibleBehavior(atom s,atom t,atom k)

 c_proc(xSfxr_setInaudibleBehavior,{s,t,k})
	
end procedure

public constant xSfxr_setLoopPoint = define_c_proc(sol,"+Sfxr_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Sfxr_setLoopPoint(atom s,atom pt)

 c_proc(xSfxr_setLoopPoint,{s,pt})
	
end procedure

public constant xSfxr_getLoopPoint = define_c_func(sol,"+Sfxr_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Sfxr_getLoopPoint(atom s)

 return c_func(xSfxr_getLoopPoint,{s})
	
end function

public constant xSfxr_setFilter = define_c_proc(sol,"+Sfxr_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Sfxr_setFilter(atom s,atom id,atom f)

 c_proc(xSfxr_setFilter,{s,id,f})
	
end procedure

public constant xSfxr_stop = define_c_proc(sol,"+Sfxr_stop",{C_POINTER})

public procedure Sfxr_stop(atom s)

 c_proc(xSfxr_stop,{s})
	
end procedure

--Speech Functions

public constant xSpeech_destroy = define_c_proc(sol,"+Speech_destroy",{C_POINTER})

public procedure Speech_destroy(atom s)

 c_proc(xSpeech_destroy,{s})
	
end procedure

public constant xSpeech_create = define_c_func(sol,"+Speech_create",{},C_POINTER)

public function Speech_create()

 return c_func(xSpeech_create,{})
	
end function

public constant xSpeech_setText = define_c_func(sol,"+Speech_setText",{C_POINTER,C_STRING},C_INT)

public function Speech_setText(atom s,sequence txt)
 
 return c_func(xSpeech_setText,{s,txt})
	
end function

public constant xSpeech_setParams = define_c_func(sol,"+Speech_setParams",{C_POINTER},C_INT)

public function Speech_setParams(atom s)

 return c_func(xSpeech_setParams,{s})
	
end function

public constant xSpeech_setParamsEx = define_c_func(sol,"+Speech_setParamsEx",{C_POINTER,C_UINT,C_FLOAT,C_FLOAT,C_INT},C_INT)

public function Speech_setParamsEx(atom s,atom base,atom spd,atom dec,atom form)

 return c_func(xSpeech_setParamsEx,{s,base,spd,dec,form})
	
end function

public constant xSpeech_setVolume = define_c_proc(sol,"+Speech_setVolume",{C_POINTER,C_FLOAT})

public procedure Speech_setVolume(atom s,atom vol)

 c_proc(xSpeech_setVolume,{s,vol})
	
end procedure

public constant xSpeech_setLooping = define_c_proc(sol,"+Speech_setLooping",{C_POINTER,C_INT})

public procedure Speech_setLooping(atom s,atom lop)

 c_proc(xSpeech_setLooping,{s,lop})
	
end procedure

public constant xSpeech_set3dMinMaxDistance = define_c_proc(sol,"+Speech_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Speech_set3dMinMaxDistance(atom s,atom min,atom max)

 c_proc(xSpeech_set3dMinMaxDistance,{s,min,max})
	
end procedure

public constant xSpeech_set3dAttenuation = define_c_proc(sol,"+Speech_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Speech_set3dAttenuation(atom s,atom att,atom rol)

 c_proc(xSpeech_set3dAttenuation,{s,att,rol})
	
end procedure

public constant xSpeech_set3dDopplerFactor = define_c_proc(sol,"+Speech_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Speech_set3dDopplerFactor(atom s,atom dop)

 c_proc(xSpeech_set3dDopplerFactor,{s,dop})
	
end procedure

public constant xSpeech_set3dListenerRelative = define_c_proc(sol,"+Speech_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Speech_set3dListenerRelative(atom s,atom r)

 c_proc(xSpeech_set3dListenerRelative,{s,r})
	
end procedure

public constant xSpeech_set3dDistanceDelay = define_c_proc(sol,"+Speech_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Speech_set3dDistanceDelay(atom s,atom dis)

 c_proc(xSpeech_set3dDistanceDelay,{s,dis})
	
end procedure

public constant xSpeech_set3dCollider = define_c_proc(sol,"+Speech_set3dCollider",{C_POINTER,C_POINTER})

public procedure Speech_set3dCollider(atom s,atom a)

 c_proc(xSpeech_set3dCollider,{s,a})
	
end procedure

public constant xSpeech_set3dColliderEx = define_c_proc(sol,"+Speech_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Speech_set3dColliderEx(atom s,atom a,atom dat)

 c_proc(xSpeech_set3dColliderEx,{s,a,dat})
	
end procedure

public constant xSpeech_set3dAttenuator = define_c_proc(sol,"+Speech_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Speech_set3dAttenuator(atom s,atom a)

 c_proc(xSpeech_set3dAttenuator,{s,a})
	
end procedure

public constant xSpeech_setInaudibleBehavior = define_c_proc(sol,"+Speech_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Speech_setInaudibleBehavior(atom s,atom t,atom a)

 c_proc(xSpeech_setInaudibleBehavior,{s,t,a})
	
end procedure

public constant xSpeech_setLoopPoint = define_c_proc(sol,"+Speech_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Speech_setLoopPoint(atom s,atom pt)

 c_proc(xSpeech_setLoopPoint,{s,pt})
	
end procedure

public constant xSpeech_getLoopPoint = define_c_func(sol,"+Speech_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Speech_getLoopPoint(atom s)

 return c_func(xSpeech_getLoopPoint,{s})
	
end function

public constant xSpeech_setFilter = define_c_proc(sol,"+Speech_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Speech_setFilter(atom s,atom id,atom f)

 c_proc(xSpeech_setFilter,{s,id,f})
	
end procedure

public constant xSpeech_stop = define_c_proc(sol,"+Speech_stop",{C_POINTER})

public procedure Speech_stop(atom s)

 c_proc(xSpeech_stop,{s})
	
end procedure

--TedSid Functions

public constant xTedSid_destroy = define_c_proc(sol,"+TedSid_destroy",{C_POINTER})

public procedure TedSid_destroy(atom t)

 c_proc(xTedSid_destroy,{t})
	
end procedure

public constant xTedSid_create = define_c_func(sol,"+TedSid_create",{},C_POINTER)

public function TedSid_create()

 return c_func(xTedSid_create,{})
	
end function

public constant xTedSid_load = define_c_func(sol,"+TedSid_load",{C_POINTER,C_STRING},C_INT)

public function TedSid_load(atom t,sequence file)
 
 return c_func(xTedSid_load,{t,file})
	
end function

public constant xTedSid_loadToMem = define_c_func(sol,"+TedSid_loadToMem",{C_POINTER,C_STRING},C_INT)

public function TedSid_loadToMem(atom s,sequence file)
 
 return c_func(xTedSid_loadToMem,{s,file})
	
end function

public constant xTedSid_loadMem = define_c_func(sol,"+TedSid_loadMem",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function TedSid_loadMem(atom s,atom m,atom len)

 return c_func(xTedSid_loadMem,{s,m,len})
	
end function

public constant xTedSid_loadMemEx = define_c_func(sol,"+TedSid_loadMemEx",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT},C_INT)

public function TedSid_loadMemEx(atom t,atom m,atom len,atom c,atom o)

 return c_func(xTedSid_loadMemEx,{t,m,len,c,o})
	
end function

public constant xTedSid_loadFileToMem = define_c_func(sol,"+TedSid_loadFileToMem",{C_POINTER,C_POINTER},C_INT)

public function TedSid_loadFileToMem(atom s,atom f)

 return c_func(xTedSid_loadFileToMem,{s,f})
	
end function

public constant xTedSid_loadFile = define_c_func(sol,"+TedSid_loadFile",{C_POINTER,C_POINTER},C_INT)

public function TedSid_loadFile(atom t,atom f)

 return c_func(xTedSid_loadFile,{t,f})
	
end function

public constant xTedSid_setVolume = define_c_proc(sol,"+TedSid_setVolume",{C_POINTER,C_FLOAT})

public procedure TedSid_setVolume(atom t,atom vol)

 c_proc(xTedSid_setVolume,{t,vol})
	
end procedure

public constant xTedSid_setLooping = define_c_proc(sol,"+TedSid_setLooping",{C_POINTER,C_INT})

public procedure TedSid_setLooping(atom t,atom lop)

 c_proc(xTedSid_setLooping,{t,lop})
	
end procedure

public constant xTedSid_set3dMinMaxDistance = define_c_proc(sol,"+TedSid_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure TedSid_set3dMinMaxDistance(atom t,atom min,atom max)

 c_proc(xTedSid_set3dMinMaxDistance,{t,min,max})
	
end procedure

public constant xTedSid_set3dAttenuation = define_c_proc(sol,"+TedSid_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure TedSid_set3dAttenuation(atom t,atom a,atom r)

 c_proc(xTedSid_set3dAttenuation,{t,a,r})
	
end procedure

public constant xTedSid_set3dDopplerFactor = define_c_proc(sol,"+TedSid_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure TedSid_set3dDopplerFactor(atom t,atom d)

 c_proc(xTedSid_set3dDopplerFactor,{t,d})
	
end procedure

public constant xTedSid_set3dListenerRelative = define_c_proc(sol,"+TedSid_set3dListenerRelative",{C_POINTER,C_INT})

public procedure TedSid_set3dListenerRelative(atom t,atom r)

 c_proc(xTedSid_set3dListenerRelative,{t,r})
	
end procedure

public constant xTedSid_set3dDistanceDelay = define_c_proc(sol,"+TedSid_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure TedSid_set3dDistanceDelay(atom t,atom d)

 c_proc(xTedSid_set3dDistanceDelay,{t,d})
	
end procedure

public constant xTedSid_set3dCollider = define_c_proc(sol,"+TedSid_set3dCollider",{C_POINTER,C_POINTER})

public procedure TedSid_set3dCollider(atom t,atom c)

 c_proc(xTedSid_set3dCollider,{t,c})
	
end procedure

public constant xTedSid_set3dColliderEx = define_c_proc(sol,"+TedSid_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure TedSid_set3dColliderEx(atom t,atom c,atom d)

 c_proc(xTedSid_set3dColliderEx,{t,c,d})
	
end procedure

public constant xTedSid_set3dAttenuator = define_c_proc(sol,"+TedSid_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure TedSid_set3dAttenuator(atom t,atom a)

 c_proc(xTedSid_set3dAttenuator,{t,a})
	
end procedure

public constant xTedSid_setInaudibleBehavior = define_c_proc(sol,"+TedSid_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure TedSid_setInaudibleBehavior(atom t,atom m,atom k)

 c_proc(xTedSid_setInaudibleBehavior,{t,m,k})
	
end procedure

public constant xTedSid_setLoopPoint = define_c_proc(sol,"+TedSid_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure TedSid_setLoopPoint(atom t,atom pt)

 c_proc(xTedSid_setLoopPoint,{t,pt})
	
end procedure

public constant xTedSid_getLoopPoint = define_c_func(sol,"+TedSid_getLoopPoint",{C_POINTER},C_DOUBLE)

public function TedSid_getLoopPoint(atom t)

 return c_func(xTedSid_getLoopPoint,{t})
	
end function

public constant xTedSid_setFilter = define_c_proc(sol,"+TedSid_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure TedSid_setFilter(atom t,atom id,atom f)

 c_proc(xTedSid_setFilter,{t,id,f})
	
end procedure

public constant xTedSid_stop = define_c_proc(sol,"+TedSid_stop",{C_POINTER})

public procedure TedSid_stop(atom t)

 c_proc(xTedSid_stop,{t})
	
end procedure

--Vic Functions

public constant xVic_destroy = define_c_proc(sol,"+Vic_destroy",{C_POINTER})

public procedure Vic_destroy(atom v)

 c_proc(xVic_destroy,{v})
	
end procedure

public constant xVic_create = define_c_func(sol,"+Vic_create",{},C_POINTER)

public function Vic_create()

 return c_func(xVic_create,{})
	
end function

public constant xVic_setModel = define_c_proc(sol,"+Vic_setModel",{C_POINTER,C_INT})

public procedure Vic_setModel(atom v,atom mod)

 c_proc(xVic_setModel,{v,mod})
	
end procedure

public constant xVic_getModel = define_c_func(sol,"+Vic_getModel",{C_POINTER},C_INT)

public function Vic_getModel(atom v)

 return c_func(xVic_getModel,{v})
	
end function

public constant xVic_setRegister = define_c_proc(sol,"+Vic_setRegister",{C_POINTER,C_INT,C_UCHAR})

public procedure Vic_setRegister(atom v,atom r,integer v2)

 c_proc(xVic_setRegister,{v,r,v2})
	
end procedure

public constant xVic_getRegister = define_c_func(sol,"+Vic_getRegister",{C_POINTER,C_INT},C_UCHAR)

public function Vic_getRegister(atom v,atom r)

 return c_func(xVic_getRegister,{v,r})
	
end function

public constant xVic_setVolume = define_c_proc(sol,"+Vic_setVolume",{C_POINTER,C_FLOAT})

public procedure Vic_setVolume(atom v,atom vol)

 c_proc(xVic_setVolume,{v,vol})
	
end procedure

public constant xVic_setLooping = define_c_proc(sol,"+Vic_setLooping",{C_POINTER,C_INT})

public procedure Vic_setLooping(atom v,atom lop)

 c_proc(xVic_setLooping,{v,lop})
	
end procedure

public constant xVic_set3dMinMaxDistance = define_c_proc(sol,"+Vic_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Vic_set3dMinMaxDistance(atom v,atom min,atom max)

 c_proc(xVic_set3dMinMaxDistance,{v,min,max})
	
end procedure

public constant xVic_set3dAttenuation = define_c_proc(sol,"+Vic_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Vic_set3dAttenuation(atom v,atom a,atom rol)

 c_proc(xVic_set3dAttenuation,{v,a,rol})
	
end procedure

public constant xVic_set3dDopplerFactor = define_c_proc(sol,"+Vic_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Vic_set3dDopplerFactor(atom v,atom dop)

 c_proc(xVic_set3dDopplerFactor,{v,dop})
	
end procedure

public constant xVic_set3dListenerRelative = define_c_proc(sol,"+Vic_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Vic_set3dListenerRelative(atom v,atom l)

 c_proc(xVic_set3dListenerRelative,{v,l})
	
end procedure

public constant xVic_set3dDistanceDelay = define_c_proc(sol,"+Vic_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Vic_set3dDistanceDelay(atom v,atom d)

 c_proc(xVic_set3dDistanceDelay,{v,d})
	
end procedure

public constant xVic_set3dCollider = define_c_proc(sol,"+Vic_set3dCollider",{C_POINTER,C_POINTER})

public procedure Vic_set3dCollider(atom v,atom c)

 c_proc(xVic_set3dCollider,{v,c})
	
end procedure

public constant xVic_set3dColliderEx = define_c_proc(sol,"+Vic_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Vic_set3dColliderEx(atom v,atom c,atom dat)

 c_proc(xVic_set3dColliderEx,{v,c,dat})
	
end procedure

public constant xVic_set3dAttenuator = define_c_proc(sol,"+Vic_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Vic_set3dAttenuator(atom v,atom a)

 c_proc(xVic_set3dAttenuator,{v,a})
	
end procedure

public constant xVic_setInaudibleBehavior = define_c_proc(sol,"+Vic_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Vic_setInaudibleBehavior(atom v,atom m,atom k)

 c_proc(xVic_setInaudibleBehavior,{v,m,k})
	
end procedure

public constant xVic_setLoopPoint = define_c_proc(sol,"+Vic_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Vic_setLoopPoint(atom v,atom pt)

 c_proc(xVic_setLoopPoint,{v,pt})
	
end procedure

public constant xVic_getLoopPoint = define_c_func(sol,"+Vic_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Vic_getLoopPoint(atom v)

 return c_func(xVic_getLoopPoint,{v})
	
end function

public constant xVic_setFilter = define_c_proc(sol,"+Vic_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Vic_setFilter(atom v,atom id,atom f)

 c_proc(xVic_setFilter,{v,id,f})
	
end procedure

public constant xVic_stop = define_c_proc(sol,"+Vic_stop",{C_POINTER})

public procedure Vic_stop(atom v)

 c_proc(xVic_stop,{v})
	
end procedure

--Vizsn Functions

public constant xVizsn_destroy = define_c_proc(sol,"+Vizsn_destroy",{C_POINTER})

public procedure Vizsn_destroy(atom v)

 c_proc(xVizsn_destroy,{v})
	
end procedure

public constant xVizsn_create = define_c_func(sol,"+Vizsn_create",{},C_POINTER)

public function Vizsn_create()

 return c_func(xVizsn_create,{})
	
end function

public constant xVizsn_setText = define_c_proc(sol,"+Vizsn_setText",{C_POINTER,C_STRING})

public procedure Vizsn_setText(atom v,sequence t)
  
 c_proc(xVizsn_setText,{v,t})
	
end procedure

public constant xVizsn_set3dMinMaxDistance = define_c_proc(sol,"+Vizsn_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Vizsn_set3dMinMaxDistance(atom v,atom min,atom max)

 c_proc(xVizsn_set3dMinMaxDistance,{v,min,max})
	
end procedure

public constant xVizsn_set3dAttenuation = define_c_proc(sol,"+Vizsn_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Vizsn_set3dAttenuation(atom v,atom a,atom rol)

 c_proc(xVizsn_set3dAttenuation,{v,a,rol})
	
end procedure

public constant xVizsn_set3dDopplerFactor = define_c_proc(sol,"+Vizsn_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Vizsn_set3dDopplerFactor(atom v,atom dop)

 c_proc(xVizsn_set3dDopplerFactor,{v,dop})
	
end procedure

public constant xVizsn_set3dListenerRelative = define_c_proc(sol,"+Vizsn_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Vizsn_set3dListenerRelative(atom v,atom l)

 c_proc(xVizsn_set3dListenerRelative,{v,l})
	
end procedure

public constant xVizsn_set3dDistanceDelay = define_c_proc(sol,"+Vizsn_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Vizsn_set3dDistanceDelay(atom v,atom d)

 c_proc(xVizsn_set3dDistanceDelay,{v,d})
	
end procedure

public constant xVizsn_set3dCollider = define_c_proc(sol,"+Vizsn_set3dCollider",{C_POINTER,C_POINTER})

public procedure Vizsn_set3dCollider(atom v,atom c)

 c_proc(xVizsn_set3dCollider,{v,c})
	
end procedure

public constant xVizsn_set3dColliderEx = define_c_proc(sol,"+Vizsn_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Vizsn_set3dColliderEx(atom v,atom c,atom dat)

 c_proc(xVizsn_set3dColliderEx,{v,c,dat})
	
end procedure

public constant xVizsn_set3dAttenuator = define_c_proc(sol,"+Vizsn_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Vizsn_set3dAttenuator(atom v,atom a)

 c_proc(xVizsn_set3dAttenuator,{v,a})
	
end procedure

public constant xVizsn_setInaudibleBehavior = define_c_proc(sol,"+Vizsn_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Vizsn_setInaudibleBehavior(atom v,atom m,atom k)

 c_proc(xVizsn_setInaudibleBehavior,{v,m,k})
	
end procedure

public constant xVizsn_setLoopPoint = define_c_proc(sol,"+Vizsn_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Vizsn_setLoopPoint(atom v,atom pt)

 c_proc(xVizsn_setLoopPoint,{v,pt})
	
end procedure

public constant xVizsn_getLoopPoint = define_c_func(sol,"+Vizsn_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Vizsn_getLoopPoint(atom v)

 return c_func(xVizsn_getLoopPoint,{v})
	
end function

public constant xVizsn_setFilter = define_c_proc(sol,"+Vizsn_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Vizsn_setFilter(atom v,atom id,atom f)

 c_proc(xVizsn_setFilter,{v,id,f})
	
end procedure

public constant xVizsn_stop = define_c_proc(sol,"+Vizsn_stop",{C_POINTER})

public procedure Vizsn_stop(atom v)

 c_proc(xVizsn_stop,{v})
	
end procedure

--Wav Functions

public constant xWav_destroy = define_c_proc(sol,"+Wav_destroy",{C_POINTER})

public procedure Wav_destroy(atom w)

 c_proc(xWav_destroy,{w})
	
end procedure

public constant xWav_create = define_c_func(sol,"+Wav_create",{},C_POINTER)

public function Wav_create()

 return c_func(xWav_create,{})
	
end function

public constant xWav_load = define_c_func(sol,"+Wav_load",{C_POINTER,C_STRING},C_INT)

public function Wav_load(atom w,sequence file)
 
 return c_func(xWav_load,{w,file})
	
end function

public constant xWav_loadMem = define_c_func(sol,"+Wav_loadMem",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Wav_loadMem(atom w,atom m,atom l)

 return c_func(xWav_loadMem,{w,m,l})
	
end function

public constant xWav_loadMemEx = define_c_func(sol,"+Wav_loadMemEx",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT},C_INT)

public function Wav_loadMemEx(atom w,atom m,atom l,atom c,atom o)

 return c_func(xWav_loadMemEx,{w,m,l,c,o})
	
end function

public constant xWav_loadFile = define_c_func(sol,"+Wav_loadFile",{C_POINTER,C_POINTER},C_INT)

public function Wav_loadFile(atom w,atom f)

 return c_func(xWav_loadFile,{w,f})
	
end function

public constant xWav_loadRawWave8 = define_c_func(sol,"+Wav_loadRawWave8",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Wav_loadRawWave8(atom w,atom m,atom l)

 return c_func(xWav_loadRawWave8,{w,m,l})
	
end function

public constant xWav_loadRawWave8Ex = define_c_func(sol,"+Wav_loadRawWave8Ex",{C_POINTER,C_POINTER,C_UINT,C_FLOAT,C_UINT},C_INT)

public function Wav_loadRawWave8Ex(atom w,atom m,atom l,atom s,atom c)

 return c_func(xWav_loadRawWave8Ex,{w,m,l,s,c})
	
end function

public constant xWav_loadRawWave16 = define_c_func(sol,"+Wav_loadRawWave16",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Wav_loadRawWave16(atom w,atom m,atom l)

 return c_func(xWav_loadRawWave16,{w,m,l})
	
end function

public constant xWav_loadRawWave16Ex = define_c_func(sol,"+Wav_loadRawWave16Ex",{C_POINTER,C_POINTER,C_UINT,C_FLOAT,C_UINT},C_INT)

public function Wav_loadRawWave16Ex(atom w,atom m,atom l,atom s,atom c)

 return c_func(xWav_loadRawWave16Ex,{w,m,l,s,c})
	
end function

public constant xWav_loadRawWave = define_c_func(sol,"+Wav_loadRawWave",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function Wav_loadRawWave(atom w,atom m,atom l)

 return c_func(xWav_loadRawWave,{w,m,l})
	
end function

public constant xWav_loadRawWaveEx = define_c_func(sol,"+Wav_loadRawWaveEx",{C_POINTER,C_POINTER,C_UINT,C_FLOAT,C_UINT,C_INT,C_INT},C_INT)

public function Wav_loadRawWaveEx(atom w,atom m,atom l,atom s,atom a,atom c2,atom o)

 return c_func(xWav_loadRawWaveEx,{w,m,l,s,a,c2,o})
	
end function

public constant xWav_getLength = define_c_func(sol,"+Wav_getLength",{C_POINTER},C_DOUBLE)

public function Wav_getLength(atom w)

 return c_func(xWav_getLength,{w})
	
end function

public constant xWav_setVolume = define_c_proc(sol,"+Wav_setVolume",{C_POINTER,C_FLOAT})

public procedure Wav_setVolume(atom w,atom vol)

 c_proc(xWav_setVolume,{w,vol})
	
end procedure

public constant xWav_setLooping = define_c_proc(sol,"+Wav_setLooping",{C_POINTER,C_INT})

public procedure Wav_setLooping(atom w,atom lop)

 c_proc(xWav_setLooping,{w,lop})
	
end procedure

public constant xWav_set3dMinMaxDistance = define_c_proc(sol,"+Wav_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure Wav_set3dMinMaxDistance(atom v,atom min,atom max)

 c_proc(xWav_set3dMinMaxDistance,{v,min,max})
	
end procedure

public constant xWav_set3dAttenuation = define_c_proc(sol,"+Wav_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure Wav_set3dAttenuation(atom v,atom a,atom rol)

 c_proc(xWav_set3dAttenuation,{v,a,rol})
	
end procedure

public constant xWav_set3dDopplerFactor = define_c_proc(sol,"+Wav_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure Wav_set3dDopplerFactor(atom v,atom dop)

 c_proc(xWav_set3dDopplerFactor,{v,dop})
	
end procedure

public constant xWav_set3dListenerRelative = define_c_proc(sol,"+Wav_set3dListenerRelative",{C_POINTER,C_INT})

public procedure Wav_set3dListenerRelative(atom v,atom l)

 c_proc(xWav_set3dListenerRelative,{v,l})
	
end procedure

public constant xWav_set3dDistanceDelay = define_c_proc(sol,"+Wav_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure Wav_set3dDistanceDelay(atom v,atom d)

 c_proc(xWav_set3dDistanceDelay,{v,d})
	
end procedure

public constant xWav_set3dCollider = define_c_proc(sol,"+Wav_set3dCollider",{C_POINTER,C_POINTER})

public procedure Wav_set3dCollider(atom v,atom c)

 c_proc(xWav_set3dCollider,{v,c})
	
end procedure

public constant xWav_set3dColliderEx = define_c_proc(sol,"+Wav_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure Wav_set3dColliderEx(atom v,atom c,atom dat)

 c_proc(xWav_set3dColliderEx,{v,c,dat})
	
end procedure

public constant xWav_set3dAttenuator = define_c_proc(sol,"+Wav_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure Wav_set3dAttenuator(atom v,atom a)

 c_proc(xWav_set3dAttenuator,{v,a})
	
end procedure

public constant xWav_setInaudibleBehavior = define_c_proc(sol,"+Wav_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure Wav_setInaudibleBehavior(atom v,atom m,atom k)

 c_proc(xWav_setInaudibleBehavior,{v,m,k})
	
end procedure

public constant xWav_setLoopPoint = define_c_proc(sol,"+Wav_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure Wav_setLoopPoint(atom v,atom pt)

 c_proc(xWav_setLoopPoint,{v,pt})
	
end procedure

public constant xWav_getLoopPoint = define_c_func(sol,"+Wav_getLoopPoint",{C_POINTER},C_DOUBLE)

public function Wav_getLoopPoint(atom v)

 return c_func(xWav_getLoopPoint,{v})
	
end function

public constant xWav_setFilter = define_c_proc(sol,"+Wav_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure Wav_setFilter(atom v,atom id,atom f)

 c_proc(xWav_setFilter,{v,id,f})
	
end procedure

public constant xWav_stop = define_c_proc(sol,"+Wav_stop",{C_POINTER})

public procedure Wav_stop(atom v)

 c_proc(xWav_stop,{v})
	
end procedure

--WaveShaperFilter Functions

public constant xWaveShaperFilter_destroy = define_c_proc(sol,"+WaveShaperFilter_destroy",{C_POINTER})

public procedure WaveShaperFilter_destroy(atom ws)

 c_proc(xWaveShaperFilter_destroy,{ws})
	
end procedure

public constant xWaveShaperFilter_setParams = define_c_func(sol,"+WaveShaperFilter_setParams",{C_POINTER,C_FLOAT},C_INT)

public function WaveShaperFilter_setParams(atom ws,atom amt)

 return c_func(xWaveShaperFilter_setParams,{ws,amt})
	
end function

public constant xWaveShaperFilter_create = define_c_func(sol,"+WaveShaperFilter_create",{},C_POINTER)

public function WaveShaperFilter_create()

 return c_func(xWaveShaperFilter_create,{})
	
end function

public constant xWaveShaperFilter_getParamCount = define_c_func(sol,"+WaveShaperFilter_getParamCount",{C_POINTER},C_INT)

public function WaveShaperFilter_getParamCount(atom ws)

 return c_func(xWaveShaperFilter_getParamCount,{ws})
	
end function

public constant xWaveShaperFilter_getParamName = define_c_func(sol,"+WaveShaperFilter_getParamName",{C_POINTER,C_UINT},C_POINTER)

public function WaveShaperFilter_getParamName(atom ws,atom idx)

 return c_func(xWaveShaperFilter_getParamName,{ws,idx})
	
end function

public constant xWaveShaperFilter_getParamType = define_c_func(sol,"+WaveShaperFilter_getParamType",{C_POINTER,C_UINT},C_UINT)

public function WaveShaperFilter_getParamType(atom ws,atom idx)

 return c_func(xWaveShaperFilter_getParamType,{ws,idx})
	
end function

public constant xWaveShaperFilter_getParamMax = define_c_func(sol,"+WaveShaperFilter_getParamMax",{C_POINTER,C_UINT},C_FLOAT)

public function WaveShaperFilter_getParamMax(atom ws,atom idx)

 return c_func(xWaveShaperFilter_getParamMax,{ws,idx})
	
end function

public constant xWaveShaperFilter_getParamMin = define_c_func(sol,"+WaveShaperFilter_getParamMin",{C_POINTER,C_UINT},C_FLOAT)

public function WaveShaperFilter_getParamMin(atom ws,atom idx)

 return c_func(xWaveShaperFilter_getParamMin,{ws,idx})
	
end function

--WavStream Functions

public constant xWavStream_destroy = define_c_proc(sol,"+WavStream_desroy",{C_POINTER})

public procedure WavStream_destroy(atom ws)

 c_proc(xWavStream_destroy,{ws})
	
end procedure

public constant xWavStream_create = define_c_func(sol,"+WavStream_create",{},C_POINTER)

public function WavStream_create()

 return c_func(xWavStream_create,{})
	
end function

public constant xWavStream_load = define_c_func(sol,"+WavStream_load",{C_POINTER,C_STRING},C_INT)

public function WavStream_load(atom w,sequence file)
 
 return c_func(xWavStream_load,{w,file})
	
end function

public constant xWavStream_loadMem = define_c_func(sol,"+WavStream_loadMem",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function WavStream_loadMem(atom w,atom d,atom len)

 return c_func(xWavStream_loadMem,{w,d,len})
	
end function

public constant xWavStream_loadMemEx = define_c_func(sol,"+WavStream_loadMemEx",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT},C_INT)

public function WavStream_loadMemEx(atom w,atom d,atom len,atom c,atom o)

 return c_func(xWavStream_loadMemEx,{w,d,len,c,o})
	
end function

public constant xWavStream_loadToMem = define_c_func(sol,"+WavStream_loadToMem",{C_POINTER,C_STRING},C_INT)

public function WavStream_loadToMem(atom ws,sequence file)
 
 return c_func(xWavStream_loadToMem,{ws,file})
	
end function

public constant xWavStream_loadFile = define_c_func(sol,"+WavStream_loadFile",{C_POINTER,C_POINTER},C_INT)

public function WavStream_loadFile(atom ws,atom f)

 return c_func(xWavStream_loadFile,{ws,f})
	
end function

public constant xWavStream_loadFileToMem = define_c_func(sol,"+WavStream_loadFileToMem",{C_POINTER,C_POINTER},C_INT)

public function WavStream_loadFileToMem(atom ws,atom f)

 return c_func(xWavStream_loadFileToMem,{ws,f})
	
end function

public constant xWavStream_getLength = define_c_func(sol,"+WavStream_getLength",{C_POINTER},C_DOUBLE)

public function WavStream_getLength(atom ws)

 return c_func(xWavStream_getLength,{ws})
	
end function

public constant xWavStream_setVolume = define_c_proc(sol,"+WavStream_setVolume",{C_POINTER,C_FLOAT})

public procedure WavStream_setVolume(atom w,atom vol)

 c_proc(xWavStream_setVolume,{w,vol})
	
end procedure

public constant xWavStream_setLooping = define_c_proc(sol,"+WavStream_setLooping",{C_POINTER,C_INT})

public procedure WavStream_setLooping(atom w,atom lop)

 c_proc(xWavStream_setLooping,{w,lop})
	
end procedure

public constant xWavStream_set3dMinMaxDistance = define_c_proc(sol,"+WavStream_set3dMinMaxDistance",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure WavStream_set3dMinMaxDistance(atom v,atom min,atom max)

 c_proc(xWavStream_set3dMinMaxDistance,{v,min,max})
	
end procedure

public constant xWavStream_set3dAttenuation = define_c_proc(sol,"+WavStream_set3dAttenuation",{C_POINTER,C_UINT,C_FLOAT})

public procedure WavStream_set3dAttenuation(atom v,atom a,atom rol)

 c_proc(xWavStream_set3dAttenuation,{v,a,rol})
	
end procedure

public constant xWavStream_set3dDopplerFactor = define_c_proc(sol,"+WavStream_set3dDopplerFactor",{C_POINTER,C_FLOAT})

public procedure WavStream_set3dDopplerFactor(atom v,atom dop)

 c_proc(xWavStream_set3dDopplerFactor,{v,dop})
	
end procedure

public constant xWavStream_set3dListenerRelative = define_c_proc(sol,"+WavStream_set3dListenerRelative",{C_POINTER,C_INT})

public procedure WavStream_set3dListenerRelative(atom v,atom l)

 c_proc(xWavStream_set3dListenerRelative,{v,l})
	
end procedure

public constant xWavStream_set3dDistanceDelay = define_c_proc(sol,"+WavStream_set3dDistanceDelay",{C_POINTER,C_INT})

public procedure WavStream_set3dDistanceDelay(atom v,atom d)

 c_proc(xWavStream_set3dDistanceDelay,{v,d})
	
end procedure

public constant xWavStream_set3dCollider = define_c_proc(sol,"+WavStream_set3dCollider",{C_POINTER,C_POINTER})

public procedure WavStream_set3dCollider(atom v,atom c)

 c_proc(xWavStream_set3dCollider,{v,c})
	
end procedure

public constant xWavStream_set3dColliderEx = define_c_proc(sol,"+WavStream_set3dColliderEx",{C_POINTER,C_POINTER,C_INT})

public procedure WavStream_set3dColliderEx(atom v,atom c,atom dat)

 c_proc(xWavStream_set3dColliderEx,{v,c,dat})
	
end procedure

public constant xWavStream_set3dAttenuator = define_c_proc(sol,"+WavStream_set3dAttenuator",{C_POINTER,C_POINTER})

public procedure WavStream_set3dAttenuator(atom v,atom a)

 c_proc(xWavStream_set3dAttenuator,{v,a})
	
end procedure

public constant xWavStream_setInaudibleBehavior = define_c_proc(sol,"+WavStream_setInaudibleBehavior",{C_POINTER,C_INT,C_INT})

public procedure WavStream_setInaudibleBehavior(atom v,atom m,atom k)

 c_proc(xWavStream_setInaudibleBehavior,{v,m,k})
	
end procedure

public constant xWavStream_setLoopPoint = define_c_proc(sol,"+WavStream_setLoopPoint",{C_POINTER,C_DOUBLE})

public procedure WavStream_setLoopPoint(atom v,atom pt)

 c_proc(xWavStream_setLoopPoint,{v,pt})
	
end procedure

public constant xWavStream_getLoopPoint = define_c_func(sol,"+WavStream_getLoopPoint",{C_POINTER},C_DOUBLE)

public function WavStream_getLoopPoint(atom v)

 return c_func(xWavStream_getLoopPoint,{v})
	
end function

public constant xWavStream_setFilter = define_c_proc(sol,"+WavStream_setFilter",{C_POINTER,C_UINT,C_POINTER})

public procedure WavStream_setFilter(atom v,atom id,atom f)

 c_proc(xWavStream_setFilter,{v,id,f})
	
end procedure

public constant xWavStream_stop = define_c_proc(sol,"+WavStream_stop",{C_POINTER})

public procedure WavStream_stop(atom v)

 c_proc(xWavStream_stop,{v})
	
end procedure
�2624.37