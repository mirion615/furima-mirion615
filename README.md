## usersテーブル
| Column           | Type   | Options     |
| --------------   | ------ | ----------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birth_date       | string | null: false               |

### Association
- has_many : items
- has_many : purchases


## itemsテーブル
| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| title           | string     | null: false       |
| text            | text       | null: false       |
| category        | string     | null: false       |
| item_condition  | string     | null: false       |
| delivery_charge | string     | null: false       |
| ship_from       | string     | null: false       |
| days_to_ship    | string     | null: false       |
| item_price      | integer    | null: false       |
| user            | references | foreign_key: true |

### Association
- has_one    : purchase
- belongs_to : user


## addressesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| house_number  | integer    | null: false       |
| building_name | string     |
| phone_number  | integer    | null: false       |
| purchase      | references | foreign_key: true |

### Association
- belongs_to : purchase


## purchasesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- has_one    : addresses
- belongs_to : user
- belongs_to : item