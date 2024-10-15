-- Function to print usage instructions
local function printUsage()
    print("Usage: quicklove -platformer <project_name> | -topdown <project_name>")
    os.exit(1)
end

-- Check if user provided enough arguments
if #arg < 2 then
    printUsage()
end

-- Set the base folder for templates (assuming they exist in the `templates` folder)
local templateFolder = "templates/"

-- Get the template type and project name from the arguments
local templateType = arg[1]:sub(2) -- Remove the "-" from the argument
local projectName = arg[2] -- Second argument should be the project name

-- Function to copy template files to a new project folder
local function copyTemplate(templateType, projectName)
    -- Path to the template folder
    local source = templateFolder .. templateType

    -- Set the target folder with the project name (outside the quicklove folder)
    local targetFolder = "../" .. projectName .. "/"

    -- Create the target folder (this will overwrite any existing project)
    os.execute("rm -rf " .. targetFolder)
    os.execute("mkdir " .. targetFolder)

    -- Copy the template files over
    local copyCommand = "cp -r " .. source .. "/* " .. targetFolder
    os.execute(copyCommand)

    print("Successfully created a new " .. templateType .. " project in " .. targetFolder)
end

-- Parse the argument and handle different project types
if templateType == "platformer" then
    copyTemplate("platformer", projectName)
elseif templateType == "topdown" then
    copyTemplate("topdown", projectName)
else
    printUsage()
end

