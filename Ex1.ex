include SoLoud.e

include flags.e

include std/math.e
include std/get.e

atom so = Soloud_create()

Soloud_init(so,or_all({SOLOUD_CLIP_ROUNDOFF,SOLOUD_ENABLE_VISUALIZATION,SOLOUD_AUTO,SOLOUD_AUTO,SOLOUD_AUTO,SOLOUD_AUTO}))

atom spc = Speech_create()

Speech_setText(spc,"Hello World")
Speech_stop(spc)

Soloud_setGlobalVolume(so,4)
Soloud_play(so,spc)

clear_screen()

position(1,1)
puts(1,"Playing Speech\n")
position(2,1)
puts(1,"Press ESC to close\n")

integer key = 0

while 1 do
	
	key = get_key()
	
	if key = 27 then
		exit
	end if

end while

Soloud_deinit(so)

Speech_destroy(spc)
­20.14