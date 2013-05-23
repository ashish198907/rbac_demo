class CreateAccessesRolesTable < ActiveRecord::Migration
  def up
    create_table :accesses_roles, :id => false do |t|
        t.references :access
        t.references :role
    end
    add_index :accesses_roles, [:access_id, :role_id]
    add_index :accesses_roles, [:role_id, :access_id]
  end

  def down
    drop_table :accesses_roles
  end
end
