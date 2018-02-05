:Pre_start
ECHO OFF
Title VOR
Set /p Startstatus=Startup Vm? [y/n]
If /i "%Startstatus%" equ "y" (
	ECHO OFF
	Goto start
) else (
	If /i "%Startstatus%" equ "n" (
		ECHO OFF
		Goto Quit
	) else (
		ECHO OFF
		If /i "%Startstatus%" equ "y/db" (
			ECHO ON
			Goto Debug
		) else (
			If /i "%Startstatus%" equ "y/eo" (
				ECHO ON
				Goto start
			) else (
				ECHO off
				Echo Sorry I didnt get that, Could you say that again?
				Goto Pre_start
				)
			)
		)
	)

:Start
Echo Welcome to Vm_Model_Beta-1.1.1
Echo Starting.
timeout /t 2 /nobreak >nul
cls
Echo Welcome to Vm_Model_Beta-1.1.1
Echo Starting..
timeout /t 2 /nobreak >nul
cls
Echo Welcome to Vm_Model_Beta-1.1.1
Echo Starting...
timeout /t 2 /nobreak >nul
cls
Echo Startup succesful!
timeout /t 2 /nobreak >nul
cls
Goto menu_1

-----|||-----

:menu_1
cls
set /p a=Where are you from?
if /i "%a%" equ "Fillory" goto pre_sign_in
quit

-----|||-----

:pre_sign_in
Set Failed_attempts=0
Set Remaining_attempts=3
goto sign_in

-----|||-----

:sign_in
cls
Echo Failed attempts: "%Failed_attempts%"
Echo Remaining: "%Remaining_attempts%"
set /p U=username?
Find "%U%" C:\Users\Public\PublicDocuments\VmLocData\VmUList.txt && (
	echo Hello "%U%"!
	set /p P=Password?
	>nul Find "%P%" C:\Users\Public\PublicDocuments\VmLocData\"%U%"\UPL.txt && (
		goto Main_menu
	) || (
		Echo F A I L ,   T R Y   A G A I N
		set /p P=Password?
		>nul Find "%P%" C:\Users\Public\PublicDocuments\VmLocData\%U%\UPL.txt && (
			goto Main_menu
		) || (
			goto mane_menu
		)
	)
) || (
	If %Remaining_attempts% grt 0 (
		set %Failed_attempts%+1
		set %Remaining_attempts%-1
	) else (
		goto mane_menu
	)
)

-----|||-----

:Main_menu
cls
Echo welcome "%U%"!
Set /p mood=How are you today?
echo "%mood%%time%" >> /%U%/%U%mood.txt
if 5:00:00.00 lss %time% lss 9:30:00.00 (
	echo Well I hope your morning goes well!
) else (
	If %time% lss 3:45:00.00 (
		Echo I hope you find yourself having fun today!
	) else (
		if %time% lss 9:00:00.00 (
			echo I hope your afternoon brings you joy!
		) else (
			if %time% lss 9:00:00.00 (
				Echo Get some sleep dummy!
			) else ( 
				if %time% lss 5:00:00.00 (
					Go to bed!
				)
			)
		)
	)
Set /p desired_action=What do you need?
If /i "%desired_action%" equ "help" (
	open support.txt

-----|||-----

:mane_menu 
cls
Echo Goodbye!
Echo Terminating login session. . .
Shutdown /f