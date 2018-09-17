# vrchat_world_occupants

This is a batch to output occupants of the targeted vrchat worlds.


# Prerequisites
You have to be able to use ruby.

# Usage

You must write the id of the target world's id for `config/target_world.yml`.
For example.
```
 - wrld_12740759-476d-41f1-92aa-6855e997837c
 - wrld_b51f016d-1073-4c75-930d-9f44222c7fc3
```
And it's simple. All you have to do is just execute this batch.
```
$ ruby get_world_visitors.rb
["{world_id => wrld_12740759-476d-41f1-92aa-6855e997837c , {world_name => Hamster cage , {occupants => 0 }}", "{world_id => wrld_b51f016d-1073-4c75-930d-9f44222c7fc3 , {world_name => The Hub , {occupants => 89 }}"]
```
