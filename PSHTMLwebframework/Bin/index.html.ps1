[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [String] $WebsiteTitle,

    [ValidateSet("fixed width","full width")]
    [Parameter(Mandatory=$false)]
    [String] $ContainerStyle
)

# <!-- Do not change this code -->
$page  = "home"
$Label = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())

switch($ContainerStyle){
    "fixed width" {$ContainerStyleOut = "container-md pt-3 bg-light text-dark"}
    "full width"  {$ContainerStyleOut = "container-fluid pt-3 bg-light text-dark"}
}
$ContainerStyleIn  = "container-fluid"

# <!-- Here you can change the content for your website, but never change the head, the header, the nav, or the footer -->
$HTML = html {

    # <!-- Do not change the head -->
    head {
                
        Include meta
        
        Title "$($page.ToUpper()) | $($WebsiteTitle)"
    }

    body {
        
        # <!-- Do not change the header -->
        header {

            Include header

        }

        # <!-- Do not change the nav -->
        nav -class "navbar navbar-expand-sm bg-dark navbar-dark sticky-top" -content {

            # <!-- Brand -->
            a -class "navbar-brand" -href "#" -content {
    
                img -src "Assets/IMG/pshtml.png" -alt "Logo" -style "width:60px"
            
            }
            
            # <!-- Toggler/collapsibe Button -->
            button -class "navbar-toggler" -Attributes @{
                "type"="button"
                "data-toggle"="collapse"
                "data-target"="#collapsibleNavbar"
            } -content {
                span -class "navbar-toggler-icon"
            }

            # <!-- Navbar links -->
            div -class "collapse navbar-collapse" -id "collapsibleNavbar" -Content {

                ul -class "navbar-nav" -content {

                    Include navbar
    
                    #FixedLinks
                    li -class "nav-item" -content {
                        a -class "nav-link" -href "https://pshtml.readthedocs.io/" -Target _blank -content { "PSHTML" }
                    }
            
                    li -class "nav-item" -content {
                        a -class "nav-link" -href "https://getbootstrap.com/" -Target _blank -content { "Bootstrap" }
                    }
            
                    li -class "nav-item" -content {
                        a -class "nav-link" -href "https://www.w3schools.com/" -Target _blank -content { "w3schools" }
                    }
            
                }
    
            }

        }

        # <!-- Here you can change the content for your website -->
        section -id "Section1" -Content {

            div -Class "$ContainerStyleOut" -Content {

                # <!-- Here you can change the content for your website -->

                article -id "Jumbotron1" -Content {

                    div -id "j1" -class 'jumbotron text-center' -content {
                
                        h1 "$($WebsiteTitle)"

                        hr

                        p {
                            "Automatically created website "
                            b { $($Label) }
                            $link = a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframework/blob/develop/README.md" -Target _blank
                            " | Generated with $($link)"
                        }
                    } 

                }

                article -id "SiteOverview" -Content {

                    div -id "1" -class "$ContainerStyleIn" -Content {

                        h1 "$($Label) PSHTML Webframework"

                        p {
                            "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts."
                        }

                    }

                }

                article -id "SiteContent1" -Content {

                    div -id "2" -class "$ContainerStyleIn text-center" -Content {

                        div -id "2.1" -class "picture" -Content {

                            img -src "Assets/IMG/words.png" -class "img-rounded mx-auto d-block" -alt "PowerShell Words" -Style "padding:40px"

                        }

                    }

                }

                article -id "SiteContent2" -Content {

                    div -id "2" -class "$ContainerStyleIn" -Content {

                        h2 "Lorem ipsum dolor sit amet"

                        p {
                            "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                        }

                    }

                }
            
                br
                
            }

        }

        # <!-- Do not change the footer -->
        Footer {
                
            Include -Name footer
            
        }
    
    }
        
}

# <!-- Do not change this code -->
$Current      = (Split-Path -Path $MyInvocation.MyCommand.Path)
$Root         = ((Get-Item $Current).Parent).FullName
$HTMLRoot     = Join-Path -Path $Root -ChildPath "pode"
$HTMLBlogPath = Join-Path -Path $HTMLRoot -ChildPath "views"
$HTML | out-File -Filepath (Join-Path -Path $($HTMLBlogPath) -ChildPath "index.html") -Encoding utf8
