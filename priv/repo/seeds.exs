if Mix.env() !== :test do
  alias ExzeitableWeb.Accounts.User
  alias ExzeitableWeb.Repo

  Repo.delete_all(User)

  [
    %User{name: "Bob", location: "Utah", hobby: "Dancing"},
    %User{name: "Suzy", location: "Utah", hobby: "Cycling"},
    %User{name: "Jeff", location: "Utah", hobby: "Dancing"},
    %User{name: "Alan", location: "Utah", hobby: "Guinea Pigs"},
    %User{name: "Mark", location: "Utah", hobby: "Cycling"},
    %User{name: "Nancy", location: "Utah", hobby: "Gymnastics"},
    %User{name: "Sioban", location: "Utah", hobby: "Murder"}
  ]
  |> Enum.map(&Repo.insert/1)
end
