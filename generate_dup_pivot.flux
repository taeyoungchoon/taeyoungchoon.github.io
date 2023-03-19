import "generate"

data = generate.from(
    count: 3,
    fn: (n) => (n + 1) * (n + 2),
    start: 2021-01-01T00:00:00Z,
    stop: 2021-01-02T00:00:00Z,
)

data 
    |> duplicate(column: "_value", as: "vv") 
    |> pivot(rowKey: ["_time"], columnKey: ["vv"], valueColumn: "_value")




