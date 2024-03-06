### Flow of object creation

```ruby
SchoolAdmin --> School --> Course --> Batch --> Enrollment <-- Student
      |             |         |         |             |
      +-------------+         +---------+             |
                  |                                   |
                  +-----------------------------------+
```

---

### Points to remember:
- All listed features have been implemented
- I've made additional choices to make sure the data is consistent in models validations and also made sure the validations are also enforced at database level.
- Student, SchoolAdmin and Admin are STIs inheriting from User model
- Authentication with Devise
- Authorization with Pundit

---

### Test explanantions:
  spec/models - Holds tests for all model based validations and associations
  spec/controllers - Holds tests for controller and all actions, making sure the data to be send and received in consecutive requests are perfectly aligned as expected
  spec/policies - Holds tests to check the enforcing of all the authorization policies


| HTTP Verb | Endpoint                | Description                               | Authorization Required          |
|-----------|-------------------------|-------------------------------------------|---------------------------------|
| POST      | `/schools`              | Create a new school                       | Admin                           |
| GET       | `/schools`              | List all schools                          | Admin                           |
| GET       | `/schools/:id`          | Get details of a specific school          | Admin, school's SchoolAdmin     |
| PUT       | `/schools/:id`          | Update a school's information             | Admin, school's SchoolAdmin     |
| DELETE    | `/schools/:id`          | Delete a school                           | Admin                           |
| POST      | `/school_admins`        | Create a new SchoolAdmin                  | Admin                           |
| GET       | `/school_admins`        | List all SchoolAdmins                     | Admin                           |
| GET       | `/school_admins/:id`    | Get details of a specific SchoolAdmin     | Admin                           |
| PUT       | `/school_admins/:id`    | Update a SchoolAdmin's information        | Admin                           |
| DELETE    | `/school_admins/:id`    | Delete a SchoolAdmin                      | Admin                           |
| POST      | `/courses`              | Create a new course                       | Admin, SchoolAdmin              |
| GET       | `/courses`              | List all courses within their schools     | Admin, SchoolAdmin              |
| PUT       | `/courses/:id`          | Update a course's information             | Admin, SchoolAdmin              |
| DELETE    | `/courses/:id`          | Delete a course                           | Admin, SchoolAdmin              |
| POST      | `/batches`              | Create a new batch for a course           | Admin, SchoolAdmin              |
| GET       | `/batches`              | List all batches within their courses     | Admin, SchoolAdmin              |
| PUT       | `/batches/:id`          | Update a batch's information              | Admin, SchoolAdmin              |
| DELETE    | `/batches/:id`          | Delete a batch                            | Admin, SchoolAdmin              |
| POST      | `/enrollments`          | Approve or deny an enrollment request     | Admin, Partially by Student     |
| GET       | `/enrollments`          | List all enrollment requests by student   | Admin for all, Student for self |
| PUT       | `/enrollments/:id`      | Update an enrollment request status       | Admin                           |


Future upgradations:
For example we need the inclusion of Teachers in the system, we can further add changes such as:

```ruby
class Teacher < User
  belongs_to :school
  has_many :courses
  has_many :batches, through: :courses
end
```
