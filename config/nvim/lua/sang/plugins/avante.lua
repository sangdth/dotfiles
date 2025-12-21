return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "ravitemer/mcphub.nvim",
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "HakonHarnes/img-clip.nvim", -- support for image pasting
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    -- Since auto-suggestions are a high-frequency operation and therefore expensive,
    -- it is recommended to specify an inexpensive provider
    mode = "agentic",
    cursor_applying_provider = nil,
    -- dual_boost = {
    --   enabled = false,
    --   first_provider = "deepseek-reasoner",
    --   second_provider = "deepseek-chat",
    --   prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
    --   timeout = 6000, -- Timeout in milliseconds
    -- },
    behaviour = {
      auto_focus_sidebar = true,
      auto_suggestions = true, -- Experimental stage
      auto_suggestions_respect_ignore = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      jump_result_buffer_on_finish = false,
      support_paste_from_clipboard = true,
      minimize_diff = true,
      enable_token_counting = true,
      enable_cursor_planning_mode = false,
    },
    auto_suggestions_provider = "yescale:claude",
    provider = "yescale:claude",
    providers = {
      ["deepseek-chat"] = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com",
        api_key_name = "DEEPSEEK_API_KEY",
        model = "deepseek-chat",
      },
      ["deepseek-reasoner"] = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com",
        api_key_name = "DEEPSEEK_API_KEY",
        model = "deepseek-reasoner",
      },
      ["yescale:claude"] = {
        __inherited_from = "openai",
        endpoint = "https://api.yescale.io/v1",
        api_key_name = "AVANTE_YESCALE_API_KEY",
        model = "claude-3-7-sonnet-20250219",
      },
      ["openrouter:claude"] = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "anthropic/claude-3.7-sonnet",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.2,
          max_tokens = 100000,
        },
      },
      ["openrouter:claude:autocompletion"] = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "anthropic/claude-3.7-sonnet",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.5,
          max_tokens = 10000,
        },
      },
      ["openrouter:claude:thinking"] = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "anthropic/claude-3.7-sonnet:thinking",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 200000,
        },
      },
    },
  },
}
