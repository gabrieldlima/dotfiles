Set-PSReadLineOption -EditMode Emacs

function prompt {
    $loc = $executionContext.SessionState.Path.CurrentLocation;

    $out = ""
        if ($loc.Provider.Name -eq "FileSystem") {
            $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
        }
    $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
    return $out
}
