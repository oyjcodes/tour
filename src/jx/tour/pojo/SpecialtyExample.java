package jx.tour.pojo;

import java.util.ArrayList;
import java.util.List;

public class SpecialtyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SpecialtyExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTnumIsNull() {
            addCriterion("tNum is null");
            return (Criteria) this;
        }

        public Criteria andTnumIsNotNull() {
            addCriterion("tNum is not null");
            return (Criteria) this;
        }

        public Criteria andTnumEqualTo(Integer value) {
            addCriterion("tNum =", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotEqualTo(Integer value) {
            addCriterion("tNum <>", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumGreaterThan(Integer value) {
            addCriterion("tNum >", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("tNum >=", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumLessThan(Integer value) {
            addCriterion("tNum <", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumLessThanOrEqualTo(Integer value) {
            addCriterion("tNum <=", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumIn(List<Integer> values) {
            addCriterion("tNum in", values, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotIn(List<Integer> values) {
            addCriterion("tNum not in", values, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumBetween(Integer value1, Integer value2) {
            addCriterion("tNum between", value1, value2, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotBetween(Integer value1, Integer value2) {
            addCriterion("tNum not between", value1, value2, "tnum");
            return (Criteria) this;
        }

        public Criteria andTcategoryIsNull() {
            addCriterion("tCategory is null");
            return (Criteria) this;
        }

        public Criteria andTcategoryIsNotNull() {
            addCriterion("tCategory is not null");
            return (Criteria) this;
        }

        public Criteria andTcategoryEqualTo(String value) {
            addCriterion("tCategory =", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryNotEqualTo(String value) {
            addCriterion("tCategory <>", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryGreaterThan(String value) {
            addCriterion("tCategory >", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryGreaterThanOrEqualTo(String value) {
            addCriterion("tCategory >=", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryLessThan(String value) {
            addCriterion("tCategory <", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryLessThanOrEqualTo(String value) {
            addCriterion("tCategory <=", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryLike(String value) {
            addCriterion("tCategory like", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryNotLike(String value) {
            addCriterion("tCategory not like", value, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryIn(List<String> values) {
            addCriterion("tCategory in", values, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryNotIn(List<String> values) {
            addCriterion("tCategory not in", values, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryBetween(String value1, String value2) {
            addCriterion("tCategory between", value1, value2, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTcategoryNotBetween(String value1, String value2) {
            addCriterion("tCategory not between", value1, value2, "tcategory");
            return (Criteria) this;
        }

        public Criteria andTnameIsNull() {
            addCriterion("tName is null");
            return (Criteria) this;
        }

        public Criteria andTnameIsNotNull() {
            addCriterion("tName is not null");
            return (Criteria) this;
        }

        public Criteria andTnameEqualTo(String value) {
            addCriterion("tName =", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotEqualTo(String value) {
            addCriterion("tName <>", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameGreaterThan(String value) {
            addCriterion("tName >", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameGreaterThanOrEqualTo(String value) {
            addCriterion("tName >=", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLessThan(String value) {
            addCriterion("tName <", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLessThanOrEqualTo(String value) {
            addCriterion("tName <=", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLike(String value) {
            addCriterion("tName like", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotLike(String value) {
            addCriterion("tName not like", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameIn(List<String> values) {
            addCriterion("tName in", values, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotIn(List<String> values) {
            addCriterion("tName not in", values, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameBetween(String value1, String value2) {
            addCriterion("tName between", value1, value2, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotBetween(String value1, String value2) {
            addCriterion("tName not between", value1, value2, "tname");
            return (Criteria) this;
        }

        public Criteria andTpriceIsNull() {
            addCriterion("tPrice is null");
            return (Criteria) this;
        }

        public Criteria andTpriceIsNotNull() {
            addCriterion("tPrice is not null");
            return (Criteria) this;
        }

        public Criteria andTpriceEqualTo(Double value) {
            addCriterion("tPrice =", value, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceNotEqualTo(Double value) {
            addCriterion("tPrice <>", value, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceGreaterThan(Double value) {
            addCriterion("tPrice >", value, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceGreaterThanOrEqualTo(Double value) {
            addCriterion("tPrice >=", value, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceLessThan(Double value) {
            addCriterion("tPrice <", value, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceLessThanOrEqualTo(Double value) {
            addCriterion("tPrice <=", value, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceIn(List<Double> values) {
            addCriterion("tPrice in", values, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceNotIn(List<Double> values) {
            addCriterion("tPrice not in", values, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceBetween(Double value1, Double value2) {
            addCriterion("tPrice between", value1, value2, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpriceNotBetween(Double value1, Double value2) {
            addCriterion("tPrice not between", value1, value2, "tprice");
            return (Criteria) this;
        }

        public Criteria andTpicIsNull() {
            addCriterion("tPic is null");
            return (Criteria) this;
        }

        public Criteria andTpicIsNotNull() {
            addCriterion("tPic is not null");
            return (Criteria) this;
        }

        public Criteria andTpicEqualTo(String value) {
            addCriterion("tPic =", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicNotEqualTo(String value) {
            addCriterion("tPic <>", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicGreaterThan(String value) {
            addCriterion("tPic >", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicGreaterThanOrEqualTo(String value) {
            addCriterion("tPic >=", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicLessThan(String value) {
            addCriterion("tPic <", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicLessThanOrEqualTo(String value) {
            addCriterion("tPic <=", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicLike(String value) {
            addCriterion("tPic like", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicNotLike(String value) {
            addCriterion("tPic not like", value, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicIn(List<String> values) {
            addCriterion("tPic in", values, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicNotIn(List<String> values) {
            addCriterion("tPic not in", values, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicBetween(String value1, String value2) {
            addCriterion("tPic between", value1, value2, "tpic");
            return (Criteria) this;
        }

        public Criteria andTpicNotBetween(String value1, String value2) {
            addCriterion("tPic not between", value1, value2, "tpic");
            return (Criteria) this;
        }

        public Criteria andPic2IsNull() {
            addCriterion("pic2 is null");
            return (Criteria) this;
        }

        public Criteria andPic2IsNotNull() {
            addCriterion("pic2 is not null");
            return (Criteria) this;
        }

        public Criteria andPic2EqualTo(String value) {
            addCriterion("pic2 =", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2NotEqualTo(String value) {
            addCriterion("pic2 <>", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2GreaterThan(String value) {
            addCriterion("pic2 >", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2GreaterThanOrEqualTo(String value) {
            addCriterion("pic2 >=", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2LessThan(String value) {
            addCriterion("pic2 <", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2LessThanOrEqualTo(String value) {
            addCriterion("pic2 <=", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2Like(String value) {
            addCriterion("pic2 like", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2NotLike(String value) {
            addCriterion("pic2 not like", value, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2In(List<String> values) {
            addCriterion("pic2 in", values, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2NotIn(List<String> values) {
            addCriterion("pic2 not in", values, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2Between(String value1, String value2) {
            addCriterion("pic2 between", value1, value2, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic2NotBetween(String value1, String value2) {
            addCriterion("pic2 not between", value1, value2, "pic2");
            return (Criteria) this;
        }

        public Criteria andPic3IsNull() {
            addCriterion("pic3 is null");
            return (Criteria) this;
        }

        public Criteria andPic3IsNotNull() {
            addCriterion("pic3 is not null");
            return (Criteria) this;
        }

        public Criteria andPic3EqualTo(String value) {
            addCriterion("pic3 =", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3NotEqualTo(String value) {
            addCriterion("pic3 <>", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3GreaterThan(String value) {
            addCriterion("pic3 >", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3GreaterThanOrEqualTo(String value) {
            addCriterion("pic3 >=", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3LessThan(String value) {
            addCriterion("pic3 <", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3LessThanOrEqualTo(String value) {
            addCriterion("pic3 <=", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3Like(String value) {
            addCriterion("pic3 like", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3NotLike(String value) {
            addCriterion("pic3 not like", value, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3In(List<String> values) {
            addCriterion("pic3 in", values, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3NotIn(List<String> values) {
            addCriterion("pic3 not in", values, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3Between(String value1, String value2) {
            addCriterion("pic3 between", value1, value2, "pic3");
            return (Criteria) this;
        }

        public Criteria andPic3NotBetween(String value1, String value2) {
            addCriterion("pic3 not between", value1, value2, "pic3");
            return (Criteria) this;
        }

        public Criteria andStocknumIsNull() {
            addCriterion("stocknum is null");
            return (Criteria) this;
        }

        public Criteria andStocknumIsNotNull() {
            addCriterion("stocknum is not null");
            return (Criteria) this;
        }

        public Criteria andStocknumEqualTo(Integer value) {
            addCriterion("stocknum =", value, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumNotEqualTo(Integer value) {
            addCriterion("stocknum <>", value, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumGreaterThan(Integer value) {
            addCriterion("stocknum >", value, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumGreaterThanOrEqualTo(Integer value) {
            addCriterion("stocknum >=", value, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumLessThan(Integer value) {
            addCriterion("stocknum <", value, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumLessThanOrEqualTo(Integer value) {
            addCriterion("stocknum <=", value, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumIn(List<Integer> values) {
            addCriterion("stocknum in", values, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumNotIn(List<Integer> values) {
            addCriterion("stocknum not in", values, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumBetween(Integer value1, Integer value2) {
            addCriterion("stocknum between", value1, value2, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStocknumNotBetween(Integer value1, Integer value2) {
            addCriterion("stocknum not between", value1, value2, "stocknum");
            return (Criteria) this;
        }

        public Criteria andStageIsNull() {
            addCriterion("stage is null");
            return (Criteria) this;
        }

        public Criteria andStageIsNotNull() {
            addCriterion("stage is not null");
            return (Criteria) this;
        }

        public Criteria andStageEqualTo(Integer value) {
            addCriterion("stage =", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotEqualTo(Integer value) {
            addCriterion("stage <>", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageGreaterThan(Integer value) {
            addCriterion("stage >", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageGreaterThanOrEqualTo(Integer value) {
            addCriterion("stage >=", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageLessThan(Integer value) {
            addCriterion("stage <", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageLessThanOrEqualTo(Integer value) {
            addCriterion("stage <=", value, "stage");
            return (Criteria) this;
        }

        public Criteria andStageIn(List<Integer> values) {
            addCriterion("stage in", values, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotIn(List<Integer> values) {
            addCriterion("stage not in", values, "stage");
            return (Criteria) this;
        }

        public Criteria andStageBetween(Integer value1, Integer value2) {
            addCriterion("stage between", value1, value2, "stage");
            return (Criteria) this;
        }

        public Criteria andStageNotBetween(Integer value1, Integer value2) {
            addCriterion("stage not between", value1, value2, "stage");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}