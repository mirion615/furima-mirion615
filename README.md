## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many : items
- has_many : purchases


## itemsテーブル
| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| title           | string     | null: false       |
| text            | text       | null: false       |
| category        | integer    | null: false       |
| item_condition  | integer    | null: false       |
| delivery_charge | integer    | null: false       |
| ship_from       | integer    | null: false       |
| days_to_ship    | integer    | null: false       |
| item_price      | integer    | null: false       |
| user            | references | foreign_key: true |

### Association
- has_one    : purchase
- belongs_to : user


## addressesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture    | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | integer    | null: false       |
| building_name | string     |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association
- belongs_to : purchase


## purchasesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- has_one    : address
- belongs_to : user
- belongs_to : item