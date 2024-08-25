local label =
[[
  ||
  ||
  ||  ░█████╗░░██████╗  ███╗░░░███╗███████╗████████╗██████╗░░█████╗░
  ||  ██╔══██╗██╔════╝  ████╗░████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
  ||  ██║░░╚═╝╚█████╗░  ██╔████╔██║█████╗░░░░░██║░░░██████╔╝██║░░██║
  ||  ██║░░██╗░╚═══██╗  ██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══██╗██║░░██║
  ||  ╚█████╔╝██████╔╝  ██║░╚═╝░██║███████╗░░░██║░░░██║░░██║╚█████╔╝
  ||  ░╚════╝░╚═════╝░  ╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░
  ||
  ||]]

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

-- Grabs the latest version number from the web GitHub
PerformHttpRequest( "https://raw.githubusercontent.com/reevesplayer/cs-studio-versioncheck/main/cs-metro.txt", function( err, text, headers )
	-- Wait to reduce spam
	Citizen.Wait( 2000 )

	-- Print the branding!
	print( label )

	-- Get the current resource version
	local curVer = GetCurrentVersion()

	print( "  ||    Current version: " .. curVer )

	if ( text ~= nil ) then
		-- Print latest version
		print( "  ||    Latest recommended version: " .. text)

		-- If the versions are different, print it out
	else
		-- In case the version can not be requested, print out an error message
		print( "  ||    ^1There was an error getting the latest version information.\n^0<br>  ||" )
	end
end )