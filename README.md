# McFeely

This is a simple app that is helping me verify the postmark updates I'm making to swoosh.

Sample run output:

```
iex(1)> McFeely.send_tests()
deliver_transactional
{:ok, %{id: "19ea9bb3-9f93-4eb0-b010-65dc88a8cc37"}}
deliver_many_transactional
{:ok,
 [
   %{error_code: 0, id: "7b37c9bc-a488-4d8f-ba62-2919b0d5871a", message: "OK"},
   %{error_code: 0, id: "5f4a50ea-590f-4896-924d-b75e160c61bb", message: "OK"}
 ]}
deliver_transactional_with_template
{:ok, %{id: "1aec7326-a59c-49cc-b6bd-700b26ffc112"}}
deliver_many_broadcast
{:ok,
 [
   %{error_code: 0, id: "fff23279-267d-49d1-9274-3edadb231297", message: "OK"},
   %{error_code: 0, id: "a9cbfb40-47fb-4b73-ae40-560affdd8e91", message: "OK"}
 ]}
deliver_many_broadcast_with_template
{:ok,
 [
   %{error_code: 0, id: "3fcddcb5-e070-4a10-94af-c01e5e21e3b0", message: "OK"},
   %{error_code: 0, id: "1cc05c46-ebbb-4b5d-8af7-a5a9962b9f6d", message: "OK"}
 ]}
{:ok,
 [
   %{error_code: 0, id: "3fcddcb5-e070-4a10-94af-c01e5e21e3b0", message: "OK"},
   %{error_code: 0, id: "1cc05c46-ebbb-4b5d-8af7-a5a9962b9f6d", message: "OK"}
 ]}
iex(2)> 
```