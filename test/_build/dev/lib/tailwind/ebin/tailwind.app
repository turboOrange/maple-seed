{application,tailwind,
             [{modules,['Elixir.Mix.Tasks.Tailwind',
                        'Elixir.Mix.Tasks.Tailwind.Install',
                        'Elixir.Tailwind']},
              {optional_applications,[inets,ssl]},
              {applications,[kernel,stdlib,elixir,logger,inets,ssl,castore]},
              {description,"Mix tasks for installing and invoking tailwind"},
              {registered,[]},
              {vsn,"0.2.4"},
              {mod,{'Elixir.Tailwind',[]}},
              {env,[{default,[]}]}]}.
