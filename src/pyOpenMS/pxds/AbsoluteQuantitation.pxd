from Types cimport *
from Param cimport *
from AbsoluteQuantitationMethod cimport *
from AbsoluteQuantitationStandards cimport *
from Feature cimport *
from FeatureMap cimport *
from String cimport *
from DefaultParamHandler cimport *

cdef extern from "<OpenMS/ANALYSIS/QUANTITATION/AbsoluteQuantitation.h>" namespace "OpenMS":

    cdef cppclass AbsoluteQuantitation(DefaultParamHandler) :
        # wrap-inherits:
        #  DefaultParamHandler

        AbsoluteQuantitation() nogil except +
        AbsoluteQuantitation(AbsoluteQuantitation &)  nogil except + # compiler

        void setQuantMethods(libcpp_vector[ AbsoluteQuantitationMethod ]& quant_methods) nogil except +
        libcpp_vector[ AbsoluteQuantitationMethod ] getQuantMethods() nogil except +
        double calculateRatio(Feature & component_1, Feature & component_2, const String & feature_name) nogil except +

        double applyCalibration(const Feature & component, const Feature & IS_component, const String & feature_name, 
                                const String & transformation_model, const Param & transformation_model_params) nogil except +
        void quantifyComponents(FeatureMap& unknowns) nogil except + # wrap-doc:This function applies the calibration curve, hence quantifying all the components

        bool optimizeCalibrationCurveIterative(
            libcpp_vector[ AQS_featureConcentration ] & component_concentrations,
            const String & feature_name,
            const String & transformation_model,
            const Param & transformation_model_params,
            Param & optimized_params) nogil except +

        void optimizeSingleCalibrationCurve(
            const String& component_name,
            libcpp_vector[AQS_featureConcentration]& component_concentrations) nogil except +

        # libcpp_map[ String, AbsoluteQuantitationMethod ] getQuantMethodsAsMap() nogil except +

        double calculateBias(double actual_concentration, double calculated_concentration) nogil except + # wrap-doc:This function calculates the bias of the calibration

        Param fitCalibration(libcpp_vector[ AQS_featureConcentration ] & component_concentrations,
                             const String & feature_name,
                             const String & transformation_model,
                             Param transformation_model_params) nogil except +

        void calculateBiasAndR(libcpp_vector[ AQS_featureConcentration ] & component_concentrations,
                              const String & feature_name,
                              const String & transformation_model,
                              Param & transformation_model_params,
                              libcpp_vector[ double ] & biases,
                              double & correlation_coefficient) nogil except +

        # TODO: not implemented
        # void optimizeCalibrationCurves(libcpp_map[ String, libcpp_vector[ AQS_featureConcentration ] ] & components_concentrations) nogil except +
        
