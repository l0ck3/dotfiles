local wezterm = require 'wezterm'
local module = {}

local project_dir = wezterm.home_dir .. "/Workspace"

-- Store paths globally so we can access them in callbacks
local org_paths = {}
local project_paths = {}

local function get_organizations()
  local orgs = {}
  for _, org_dir in ipairs(wezterm.glob(project_dir .. '/*')) do
    if not org_dir:match("/%.") then
      table.insert(orgs, org_dir)
    end
  end
  return orgs
end

local function get_projects(org_dir)
  local projects = {}
  for _, proj_dir in ipairs(wezterm.glob(org_dir .. '/*')) do
    if not proj_dir:match("/%.") then
      table.insert(projects, proj_dir)
    end
  end
  return projects
end

function module.choose_project()
  -- Reset our global path storage
  org_paths = {}
  project_paths = {}

  -- First, let the user choose an organization
  local org_choices = {}
  for _, org_path in ipairs(get_organizations()) do
    local org_name = org_path:match("([^/]+)$")
    table.insert(org_paths, org_path)
    table.insert(org_choices, { 
      label = org_name,
      id = tostring(#org_paths - 1)
    })
  end

  return wezterm.action.InputSelector {
    title = "Choose Organization",
    choices = org_choices,
    fuzzy = true,
    action = wezterm.action_callback(function(window, pane, id, selected)
      if not selected then return end
      
      -- Now show projects for the selected organization
      local org_path = org_paths[tonumber(id) + 1]
      project_paths = {} -- Reset project paths for new selection
      local project_choices = {}
      
      for _, proj_path in ipairs(get_projects(org_path)) do
        local proj_name = proj_path:match("([^/]+)$")
        table.insert(project_paths, proj_path)
        table.insert(project_choices, {
          label = proj_name,
          id = tostring(#project_paths - 1)
        })
      end

      window:perform_action(
        wezterm.action.InputSelector {
          title = "Choose Project in " .. selected,
          choices = project_choices,
          fuzzy = true,
          action = wezterm.action_callback(function(window, pane, id, selected)
            if not selected then return end
            
            local project_path = project_paths[tonumber(id) + 1]
            window:perform_action(
              wezterm.action.SwitchToWorkspace {
                name = selected,
                spawn = {
                  cwd = project_path
                }
              },
              pane
            )
          end)
        },
        pane
      )
    end)
  }
end

return module